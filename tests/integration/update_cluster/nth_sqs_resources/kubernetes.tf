locals {
  cluster_name                 = "nthsqsresources.example.com"
  master_autoscaling_group_ids = [aws_autoscaling_group.master-us-test-1a-masters-nthsqsresources-example-com.id]
  master_security_group_ids    = [aws_security_group.masters-nthsqsresources-example-com.id]
  masters_role_arn             = aws_iam_role.masters-nthsqsresources-example-com.arn
  masters_role_name            = aws_iam_role.masters-nthsqsresources-example-com.name
  node_autoscaling_group_ids   = [aws_autoscaling_group.nodes-nthsqsresources-example-com.id]
  node_security_group_ids      = [aws_security_group.nodes-nthsqsresources-example-com.id]
  node_subnet_ids              = [aws_subnet.us-test-1a-nthsqsresources-example-com.id]
  nodes_role_arn               = aws_iam_role.nodes-nthsqsresources-example-com.arn
  nodes_role_name              = aws_iam_role.nodes-nthsqsresources-example-com.name
  region                       = "us-test-1"
  route_table_public_id        = aws_route_table.nthsqsresources-example-com.id
  subnet_us-test-1a_id         = aws_subnet.us-test-1a-nthsqsresources-example-com.id
  vpc_cidr_block               = aws_vpc.nthsqsresources-example-com.cidr_block
  vpc_id                       = aws_vpc.nthsqsresources-example-com.id
}

output "cluster_name" {
  value = "nthsqsresources.example.com"
}

output "master_autoscaling_group_ids" {
  value = [aws_autoscaling_group.master-us-test-1a-masters-nthsqsresources-example-com.id]
}

output "master_security_group_ids" {
  value = [aws_security_group.masters-nthsqsresources-example-com.id]
}

output "masters_role_arn" {
  value = aws_iam_role.masters-nthsqsresources-example-com.arn
}

output "masters_role_name" {
  value = aws_iam_role.masters-nthsqsresources-example-com.name
}

output "node_autoscaling_group_ids" {
  value = [aws_autoscaling_group.nodes-nthsqsresources-example-com.id]
}

output "node_security_group_ids" {
  value = [aws_security_group.nodes-nthsqsresources-example-com.id]
}

output "node_subnet_ids" {
  value = [aws_subnet.us-test-1a-nthsqsresources-example-com.id]
}

output "nodes_role_arn" {
  value = aws_iam_role.nodes-nthsqsresources-example-com.arn
}

output "nodes_role_name" {
  value = aws_iam_role.nodes-nthsqsresources-example-com.name
}

output "region" {
  value = "us-test-1"
}

output "route_table_public_id" {
  value = aws_route_table.nthsqsresources-example-com.id
}

output "subnet_us-test-1a_id" {
  value = aws_subnet.us-test-1a-nthsqsresources-example-com.id
}

output "vpc_cidr_block" {
  value = aws_vpc.nthsqsresources-example-com.cidr_block
}

output "vpc_id" {
  value = aws_vpc.nthsqsresources-example-com.id
}

provider "aws" {
  region = "us-test-1"
}

resource "aws_autoscaling_group" "master-us-test-1a-masters-nthsqsresources-example-com" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.master-us-test-1a-masters-nthsqsresources-example-com.id
    version = aws_launch_template.master-us-test-1a-masters-nthsqsresources-example-com.latest_version
  }
  max_size              = 1
  metrics_granularity   = "1Minute"
  min_size              = 1
  name                  = "master-us-test-1a.masters.nthsqsresources.example.com"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "nthsqsresources.example.com"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "master-us-test-1a.masters.nthsqsresources.example.com"
  }
  tag {
    key                 = "aws-node-termination-handler/managed"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"
    propagate_at_launch = true
    value               = "master"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/master"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "master-us-test-1a"
  }
  tag {
    key                 = "kubernetes.io/cluster/nthsqsresources.example.com"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.us-test-1a-nthsqsresources-example-com.id]
}

resource "aws_autoscaling_group" "nodes-nthsqsresources-example-com" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.nodes-nthsqsresources-example-com.id
    version = aws_launch_template.nodes-nthsqsresources-example-com.latest_version
  }
  max_size              = 2
  metrics_granularity   = "1Minute"
  min_size              = 2
  name                  = "nodes.nthsqsresources.example.com"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "nthsqsresources.example.com"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "nodes.nthsqsresources.example.com"
  }
  tag {
    key                 = "aws-node-termination-handler/managed"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"
    propagate_at_launch = true
    value               = "node"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/node"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes"
  }
  tag {
    key                 = "kubernetes.io/cluster/nthsqsresources.example.com"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.us-test-1a-nthsqsresources-example-com.id]
}

resource "aws_autoscaling_lifecycle_hook" "master-us-test-1a-NTHLifecycleHook" {
  autoscaling_group_name = aws_autoscaling_group.master-us-test-1a-masters-nthsqsresources-example-com.id
  default_result         = "CONTINUE"
  heartbeat_timeout      = 300
  lifecycle_transition   = "autoscaling:EC2_INSTANCE_TERMINATING"
  name                   = "master-us-test-1a-NTHLifecycleHook"
}

resource "aws_autoscaling_lifecycle_hook" "nodes-NTHLifecycleHook" {
  autoscaling_group_name = aws_autoscaling_group.nodes-nthsqsresources-example-com.id
  default_result         = "CONTINUE"
  heartbeat_timeout      = 300
  lifecycle_transition   = "autoscaling:EC2_INSTANCE_TERMINATING"
  name                   = "nodes-NTHLifecycleHook"
}

resource "aws_cloudwatch_event_rule" "nthsqsresources-example-com-ASGLifecycle" {
  event_pattern = file("${path.module}/data/aws_cloudwatch_event_rule_nthsqsresources.example.com-ASGLifecycle_event_pattern")
  name          = "nthsqsresources.example.com-ASGLifecycle"
  tags = {
    "KubernetesCluster"                                 = "nthsqsresources.example.com"
    "Name"                                              = "nthsqsresources.example.com-ASGLifecycle"
    "kubernetes.io/cluster/nthsqsresources.example.com" = "owned"
  }
}

resource "aws_cloudwatch_event_rule" "nthsqsresources-example-com-RebalanceRecommendation" {
  event_pattern = file("${path.module}/data/aws_cloudwatch_event_rule_nthsqsresources.example.com-RebalanceRecommendation_event_pattern")
  name          = "nthsqsresources.example.com-RebalanceRecommendation"
  tags = {
    "KubernetesCluster"                                 = "nthsqsresources.example.com"
    "Name"                                              = "nthsqsresources.example.com-RebalanceRecommendation"
    "kubernetes.io/cluster/nthsqsresources.example.com" = "owned"
  }
}

resource "aws_cloudwatch_event_rule" "nthsqsresources-example-com-SpotInterruption" {
  event_pattern = file("${path.module}/data/aws_cloudwatch_event_rule_nthsqsresources.example.com-SpotInterruption_event_pattern")
  name          = "nthsqsresources.example.com-SpotInterruption"
  tags = {
    "KubernetesCluster"                                 = "nthsqsresources.example.com"
    "Name"                                              = "nthsqsresources.example.com-SpotInterruption"
    "kubernetes.io/cluster/nthsqsresources.example.com" = "owned"
  }
}

resource "aws_cloudwatch_event_target" "nthsqsresources-example-com-ASGLifecycle-Target" {
  arn  = "arn:aws:sqs:us-test-1:123456789012:nthsqsresources-example-com-nth"
  rule = aws_cloudwatch_event_rule.nthsqsresources-example-com-ASGLifecycle.id
}

resource "aws_cloudwatch_event_target" "nthsqsresources-example-com-RebalanceRecommendation-Target" {
  arn  = "arn:aws:sqs:us-test-1:123456789012:nthsqsresources-example-com-nth"
  rule = aws_cloudwatch_event_rule.nthsqsresources-example-com-RebalanceRecommendation.id
}

resource "aws_cloudwatch_event_target" "nthsqsresources-example-com-SpotInterruption-Target" {
  arn  = "arn:aws:sqs:us-test-1:123456789012:nthsqsresources-example-com-nth"
  rule = aws_cloudwatch_event_rule.nthsqsresources-example-com-SpotInterruption.id
}

resource "aws_ebs_volume" "us-test-1a-etcd-events-nthsqsresources-example-com" {
  availability_zone = "us-test-1a"
  encrypted         = false
  iops              = 3000
  size              = 20
  tags = {
    "KubernetesCluster"                                 = "nthsqsresources.example.com"
    "Name"                                              = "us-test-1a.etcd-events.nthsqsresources.example.com"
    "k8s.io/etcd/events"                                = "us-test-1a/us-test-1a"
    "k8s.io/role/master"                                = "1"
    "kubernetes.io/cluster/nthsqsresources.example.com" = "owned"
  }
  throughput = 125
  type       = "gp3"
}

resource "aws_ebs_volume" "us-test-1a-etcd-main-nthsqsresources-example-com" {
  availability_zone = "us-test-1a"
  encrypted         = false
  iops              = 3000
  size              = 20
  tags = {
    "KubernetesCluster"                                 = "nthsqsresources.example.com"
    "Name"                                              = "us-test-1a.etcd-main.nthsqsresources.example.com"
    "k8s.io/etcd/main"                                  = "us-test-1a/us-test-1a"
    "k8s.io/role/master"                                = "1"
    "kubernetes.io/cluster/nthsqsresources.example.com" = "owned"
  }
  throughput = 125
  type       = "gp3"
}

resource "aws_iam_instance_profile" "masters-nthsqsresources-example-com" {
  name = "masters.nthsqsresources.example.com"
  role = aws_iam_role.masters-nthsqsresources-example-com.name
  tags = {
    "KubernetesCluster"                                 = "nthsqsresources.example.com"
    "Name"                                              = "masters.nthsqsresources.example.com"
    "kubernetes.io/cluster/nthsqsresources.example.com" = "owned"
  }
}

resource "aws_iam_instance_profile" "nodes-nthsqsresources-example-com" {
  name = "nodes.nthsqsresources.example.com"
  role = aws_iam_role.nodes-nthsqsresources-example-com.name
  tags = {
    "KubernetesCluster"                                 = "nthsqsresources.example.com"
    "Name"                                              = "nodes.nthsqsresources.example.com"
    "kubernetes.io/cluster/nthsqsresources.example.com" = "owned"
  }
}

resource "aws_iam_role" "masters-nthsqsresources-example-com" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_masters.nthsqsresources.example.com_policy")
  name               = "masters.nthsqsresources.example.com"
  tags = {
    "KubernetesCluster"                                 = "nthsqsresources.example.com"
    "Name"                                              = "masters.nthsqsresources.example.com"
    "kubernetes.io/cluster/nthsqsresources.example.com" = "owned"
  }
}

resource "aws_iam_role" "nodes-nthsqsresources-example-com" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_nodes.nthsqsresources.example.com_policy")
  name               = "nodes.nthsqsresources.example.com"
  tags = {
    "KubernetesCluster"                                 = "nthsqsresources.example.com"
    "Name"                                              = "nodes.nthsqsresources.example.com"
    "kubernetes.io/cluster/nthsqsresources.example.com" = "owned"
  }
}

resource "aws_iam_role_policy" "masters-nthsqsresources-example-com" {
  name   = "masters.nthsqsresources.example.com"
  policy = file("${path.module}/data/aws_iam_role_policy_masters.nthsqsresources.example.com_policy")
  role   = aws_iam_role.masters-nthsqsresources-example-com.name
}

resource "aws_iam_role_policy" "nodes-nthsqsresources-example-com" {
  name   = "nodes.nthsqsresources.example.com"
  policy = file("${path.module}/data/aws_iam_role_policy_nodes.nthsqsresources.example.com_policy")
  role   = aws_iam_role.nodes-nthsqsresources-example-com.name
}

resource "aws_internet_gateway" "nthsqsresources-example-com" {
  tags = {
    "KubernetesCluster"                                 = "nthsqsresources.example.com"
    "Name"                                              = "nthsqsresources.example.com"
    "kubernetes.io/cluster/nthsqsresources.example.com" = "owned"
  }
  vpc_id = aws_vpc.nthsqsresources-example-com.id
}

resource "aws_key_pair" "kubernetes-nthsqsresources-example-com-c4a6ed9aa889b9e2c39cd663eb9c7157" {
  key_name   = "kubernetes.nthsqsresources.example.com-c4:a6:ed:9a:a8:89:b9:e2:c3:9c:d6:63:eb:9c:71:57"
  public_key = file("${path.module}/data/aws_key_pair_kubernetes.nthsqsresources.example.com-c4a6ed9aa889b9e2c39cd663eb9c7157_public_key")
  tags = {
    "KubernetesCluster"                                 = "nthsqsresources.example.com"
    "Name"                                              = "nthsqsresources.example.com"
    "kubernetes.io/cluster/nthsqsresources.example.com" = "owned"
  }
}

resource "aws_launch_template" "master-us-test-1a-masters-nthsqsresources-example-com" {
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 64
      volume_type           = "gp3"
    }
  }
  block_device_mappings {
    device_name  = "/dev/sdc"
    virtual_name = "ephemeral0"
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.masters-nthsqsresources-example-com.id
  }
  image_id      = "ami-12345678"
  instance_type = "m3.medium"
  key_name      = aws_key_pair.kubernetes-nthsqsresources-example-com-c4a6ed9aa889b9e2c39cd663eb9c7157.id
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "optional"
  }
  monitoring {
    enabled = false
  }
  name = "master-us-test-1a.masters.nthsqsresources.example.com"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    ipv6_address_count          = 0
    security_groups             = [aws_security_group.masters-nthsqsresources-example-com.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                                                     = "nthsqsresources.example.com"
      "Name"                                                                                                  = "master-us-test-1a.masters.nthsqsresources.example.com"
      "aws-node-termination-handler/managed"                                                                  = ""
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"                                      = "master"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"                          = ""
      "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
      "k8s.io/role/master"                                                                                    = "1"
      "kops.k8s.io/instancegroup"                                                                             = "master-us-test-1a"
      "kubernetes.io/cluster/nthsqsresources.example.com"                                                     = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                                                     = "nthsqsresources.example.com"
      "Name"                                                                                                  = "master-us-test-1a.masters.nthsqsresources.example.com"
      "aws-node-termination-handler/managed"                                                                  = ""
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"                                      = "master"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"                          = ""
      "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
      "k8s.io/role/master"                                                                                    = "1"
      "kops.k8s.io/instancegroup"                                                                             = "master-us-test-1a"
      "kubernetes.io/cluster/nthsqsresources.example.com"                                                     = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                                                     = "nthsqsresources.example.com"
    "Name"                                                                                                  = "master-us-test-1a.masters.nthsqsresources.example.com"
    "aws-node-termination-handler/managed"                                                                  = ""
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
    "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"                                      = "master"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"                          = ""
    "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
    "k8s.io/role/master"                                                                                    = "1"
    "kops.k8s.io/instancegroup"                                                                             = "master-us-test-1a"
    "kubernetes.io/cluster/nthsqsresources.example.com"                                                     = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_master-us-test-1a.masters.nthsqsresources.example.com_user_data")
}

resource "aws_launch_template" "nodes-nthsqsresources-example-com" {
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 128
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.nodes-nthsqsresources-example-com.id
  }
  image_id      = "ami-12345678"
  instance_type = "t2.medium"
  key_name      = aws_key_pair.kubernetes-nthsqsresources-example-com-c4a6ed9aa889b9e2c39cd663eb9c7157.id
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "optional"
  }
  monitoring {
    enabled = false
  }
  name = "nodes.nthsqsresources.example.com"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    ipv6_address_count          = 0
    security_groups             = [aws_security_group.nodes-nthsqsresources-example-com.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                          = "nthsqsresources.example.com"
      "Name"                                                                       = "nodes.nthsqsresources.example.com"
      "aws-node-termination-handler/managed"                                       = ""
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes"
      "kubernetes.io/cluster/nthsqsresources.example.com"                          = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                          = "nthsqsresources.example.com"
      "Name"                                                                       = "nodes.nthsqsresources.example.com"
      "aws-node-termination-handler/managed"                                       = ""
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes"
      "kubernetes.io/cluster/nthsqsresources.example.com"                          = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                          = "nthsqsresources.example.com"
    "Name"                                                                       = "nodes.nthsqsresources.example.com"
    "aws-node-termination-handler/managed"                                       = ""
    "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
    "k8s.io/role/node"                                                           = "1"
    "kops.k8s.io/instancegroup"                                                  = "nodes"
    "kubernetes.io/cluster/nthsqsresources.example.com"                          = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_nodes.nthsqsresources.example.com_user_data")
}

resource "aws_route" "route-0-0-0-0--0" {
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.nthsqsresources-example-com.id
  route_table_id         = aws_route_table.nthsqsresources-example-com.id
}

resource "aws_route" "route-__--0" {
  destination_ipv6_cidr_block = "::/0"
  gateway_id                  = aws_internet_gateway.nthsqsresources-example-com.id
  route_table_id              = aws_route_table.nthsqsresources-example-com.id
}

resource "aws_route_table" "nthsqsresources-example-com" {
  tags = {
    "KubernetesCluster"                                 = "nthsqsresources.example.com"
    "Name"                                              = "nthsqsresources.example.com"
    "kubernetes.io/cluster/nthsqsresources.example.com" = "owned"
    "kubernetes.io/kops/role"                           = "public"
  }
  vpc_id = aws_vpc.nthsqsresources-example-com.id
}

resource "aws_route_table_association" "us-test-1a-nthsqsresources-example-com" {
  route_table_id = aws_route_table.nthsqsresources-example-com.id
  subnet_id      = aws_subnet.us-test-1a-nthsqsresources-example-com.id
}

resource "aws_security_group" "masters-nthsqsresources-example-com" {
  description = "Security group for masters"
  name        = "masters.nthsqsresources.example.com"
  tags = {
    "KubernetesCluster"                                 = "nthsqsresources.example.com"
    "Name"                                              = "masters.nthsqsresources.example.com"
    "kubernetes.io/cluster/nthsqsresources.example.com" = "owned"
  }
  vpc_id = aws_vpc.nthsqsresources-example-com.id
}

resource "aws_security_group" "nodes-nthsqsresources-example-com" {
  description = "Security group for nodes"
  name        = "nodes.nthsqsresources.example.com"
  tags = {
    "KubernetesCluster"                                 = "nthsqsresources.example.com"
    "Name"                                              = "nodes.nthsqsresources.example.com"
    "kubernetes.io/cluster/nthsqsresources.example.com" = "owned"
  }
  vpc_id = aws_vpc.nthsqsresources-example-com.id
}

resource "aws_security_group_rule" "from-0-0-0-0--0-ingress-tcp-22to22-masters-nthsqsresources-example-com" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.masters-nthsqsresources-example-com.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group_rule" "from-0-0-0-0--0-ingress-tcp-22to22-nodes-nthsqsresources-example-com" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.nodes-nthsqsresources-example-com.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group_rule" "from-0-0-0-0--0-ingress-tcp-443to443-masters-nthsqsresources-example-com" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.masters-nthsqsresources-example-com.id
  to_port           = 443
  type              = "ingress"
}

resource "aws_security_group_rule" "from-masters-nthsqsresources-example-com-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.masters-nthsqsresources-example-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-masters-nthsqsresources-example-com-egress-all-0to0-__--0" {
  from_port         = 0
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "-1"
  security_group_id = aws_security_group.masters-nthsqsresources-example-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-masters-nthsqsresources-example-com-ingress-all-0to0-masters-nthsqsresources-example-com" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.masters-nthsqsresources-example-com.id
  source_security_group_id = aws_security_group.masters-nthsqsresources-example-com.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-masters-nthsqsresources-example-com-ingress-all-0to0-nodes-nthsqsresources-example-com" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.nodes-nthsqsresources-example-com.id
  source_security_group_id = aws_security_group.masters-nthsqsresources-example-com.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-nthsqsresources-example-com-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.nodes-nthsqsresources-example-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-nodes-nthsqsresources-example-com-egress-all-0to0-__--0" {
  from_port         = 0
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "-1"
  security_group_id = aws_security_group.nodes-nthsqsresources-example-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-nodes-nthsqsresources-example-com-ingress-all-0to0-nodes-nthsqsresources-example-com" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.nodes-nthsqsresources-example-com.id
  source_security_group_id = aws_security_group.nodes-nthsqsresources-example-com.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-nthsqsresources-example-com-ingress-tcp-1to2379-masters-nthsqsresources-example-com" {
  from_port                = 1
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-nthsqsresources-example-com.id
  source_security_group_id = aws_security_group.nodes-nthsqsresources-example-com.id
  to_port                  = 2379
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-nthsqsresources-example-com-ingress-tcp-2382to4000-masters-nthsqsresources-example-com" {
  from_port                = 2382
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-nthsqsresources-example-com.id
  source_security_group_id = aws_security_group.nodes-nthsqsresources-example-com.id
  to_port                  = 4000
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-nthsqsresources-example-com-ingress-tcp-4003to65535-masters-nthsqsresources-example-com" {
  from_port                = 4003
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-nthsqsresources-example-com.id
  source_security_group_id = aws_security_group.nodes-nthsqsresources-example-com.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-nthsqsresources-example-com-ingress-udp-1to65535-masters-nthsqsresources-example-com" {
  from_port                = 1
  protocol                 = "udp"
  security_group_id        = aws_security_group.masters-nthsqsresources-example-com.id
  source_security_group_id = aws_security_group.nodes-nthsqsresources-example-com.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_sqs_queue" "nthsqsresources-example-com-nth" {
  message_retention_seconds = 300
  name                      = "nthsqsresources-example-com-nth"
  policy                    = file("${path.module}/data/aws_sqs_queue_nthsqsresources-example-com-nth_policy")
  tags = {
    "KubernetesCluster"                                 = "nthsqsresources.example.com"
    "Name"                                              = "nthsqsresources-example-com-nth"
    "kubernetes.io/cluster/nthsqsresources.example.com" = "owned"
  }
}

resource "aws_subnet" "us-test-1a-nthsqsresources-example-com" {
  availability_zone = "us-test-1a"
  cidr_block        = "172.20.32.0/19"
  tags = {
    "KubernetesCluster"                                 = "nthsqsresources.example.com"
    "Name"                                              = "us-test-1a.nthsqsresources.example.com"
    "SubnetType"                                        = "Public"
    "kubernetes.io/cluster/nthsqsresources.example.com" = "owned"
    "kubernetes.io/role/elb"                            = "1"
    "kubernetes.io/role/internal-elb"                   = "1"
  }
  vpc_id = aws_vpc.nthsqsresources-example-com.id
}

resource "aws_vpc" "nthsqsresources-example-com" {
  assign_generated_ipv6_cidr_block = true
  cidr_block                       = "172.20.0.0/16"
  enable_dns_hostnames             = true
  enable_dns_support               = true
  tags = {
    "KubernetesCluster"                                 = "nthsqsresources.example.com"
    "Name"                                              = "nthsqsresources.example.com"
    "kubernetes.io/cluster/nthsqsresources.example.com" = "owned"
  }
}

resource "aws_vpc_dhcp_options" "nthsqsresources-example-com" {
  domain_name         = "us-test-1.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]
  tags = {
    "KubernetesCluster"                                 = "nthsqsresources.example.com"
    "Name"                                              = "nthsqsresources.example.com"
    "kubernetes.io/cluster/nthsqsresources.example.com" = "owned"
  }
}

resource "aws_vpc_dhcp_options_association" "nthsqsresources-example-com" {
  dhcp_options_id = aws_vpc_dhcp_options.nthsqsresources-example-com.id
  vpc_id          = aws_vpc.nthsqsresources-example-com.id
}

terraform {
  required_version = ">= 0.12.26"
  required_providers {
    aws = {
      "source"  = "hashicorp/aws"
      "version" = ">= 3.34.0"
    }
  }
}
