# Cluster Autoscaler IAM Role
data "aws_iam_policy_document" "autoscaler_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.oidc_provider.arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.oidc_provider.url, "https://", "")}:sub"
      values   = ["system:serviceaccount:kube-system:cluster-autoscaler"]
    }
  }
}

resource "aws_iam_role" "autoscaler_role" {
  name               = "${var.name}-autoscaler-role"
  assume_role_policy = data.aws_iam_policy_document.autoscaler_assume_role_policy.json

  depends_on = [aws_iam_openid_connect_provider.oidc_provider]
}

data "aws_iam_policy_document" "autoscaler_policy" {
  statement {
    actions = [
      "autoscaling:DescribeAutoScalingGroups",
      "autoscaling:DescribeAutoScalingInstances",
      "autoscaling:DescribeLaunchConfigurations",
      "autoscaling:DescribeTags",
      "autoscaling:SetDesiredCapacity",
      "autoscaling:TerminateInstanceInAutoScalingGroup",
      "ec2:DescribeLaunchTemplateVersions",
    ]
    resources = ["*"]
    effect    = "Allow"
  }
}

resource "aws_iam_policy" "autoscaler_policy" {
  name   = "${var.name}-autoscaler-policy"
  policy = data.aws_iam_policy_document.autoscaler_policy.json
}

resource "aws_iam_role_policy_attachment" "autoscaler_policy_attachment" {
  role       = aws_iam_role.autoscaler_role.name
  policy_arn = aws_iam_policy.autoscaler_policy.arn
}
