locals {
  bastion_autoscaling_group_ids = [aws_autoscaling_group.bastion-private-shared-subnet-example-com.id]
  bastion_security_group_ids    = [aws_security_group.bastion-private-shared-subnet-example-com.id]
  bastions_role_arn             = aws_iam_role.bastions-private-shared-subnet-example-com.arn
  bastions_role_name            = aws_iam_role.bastions-private-shared-subnet-example-com.name
  cluster_name                  = "private-shared-subnet.example.com"
  master_autoscaling_group_ids  = [aws_autoscaling_group.master-us-test-1a-masters-private-shared-subnet-example-com.id]
  master_security_group_ids     = [aws_security_group.masters-private-shared-subnet-example-com.id]
  masters_role_arn              = aws_iam_role.masters-private-shared-subnet-example-com.arn
  masters_role_name             = aws_iam_role.masters-private-shared-subnet-example-com.name
  node_autoscaling_group_ids    = [aws_autoscaling_group.nodes-private-shared-subnet-example-com.id]
  node_security_group_ids       = [aws_security_group.nodes-private-shared-subnet-example-com.id]
  node_subnet_ids               = ["subnet-12345678"]
  nodes_role_arn                = aws_iam_role.nodes-private-shared-subnet-example-com.arn
  nodes_role_name               = aws_iam_role.nodes-private-shared-subnet-example-com.name
  region                        = "us-test-1"
  subnet_ids                    = ["subnet-12345678", "subnet-abcdef"]
  subnet_us-test-1a_id          = "subnet-12345678"
  subnet_utility-us-test-1a_id  = "subnet-abcdef"
  vpc_id                        = "vpc-12345678"
}

output "bastion_autoscaling_group_ids" {
  value = [aws_autoscaling_group.bastion-private-shared-subnet-example-com.id]
}

output "bastion_security_group_ids" {
  value = [aws_security_group.bastion-private-shared-subnet-example-com.id]
}

output "bastions_role_arn" {
  value = aws_iam_role.bastions-private-shared-subnet-example-com.arn
}

output "bastions_role_name" {
  value = aws_iam_role.bastions-private-shared-subnet-example-com.name
}

output "cluster_name" {
  value = "private-shared-subnet.example.com"
}

output "master_autoscaling_group_ids" {
  value = [aws_autoscaling_group.master-us-test-1a-masters-private-shared-subnet-example-com.id]
}

output "master_security_group_ids" {
  value = [aws_security_group.masters-private-shared-subnet-example-com.id]
}

output "masters_role_arn" {
  value = aws_iam_role.masters-private-shared-subnet-example-com.arn
}

output "masters_role_name" {
  value = aws_iam_role.masters-private-shared-subnet-example-com.name
}

output "node_autoscaling_group_ids" {
  value = [aws_autoscaling_group.nodes-private-shared-subnet-example-com.id]
}

output "node_security_group_ids" {
  value = [aws_security_group.nodes-private-shared-subnet-example-com.id]
}

output "node_subnet_ids" {
  value = ["subnet-12345678"]
}

output "nodes_role_arn" {
  value = aws_iam_role.nodes-private-shared-subnet-example-com.arn
}

output "nodes_role_name" {
  value = aws_iam_role.nodes-private-shared-subnet-example-com.name
}

output "region" {
  value = "us-test-1"
}

output "subnet_ids" {
  value = ["subnet-12345678", "subnet-abcdef"]
}

output "subnet_us-test-1a_id" {
  value = "subnet-12345678"
}

output "subnet_utility-us-test-1a_id" {
  value = "subnet-abcdef"
}

output "vpc_id" {
  value = "vpc-12345678"
}

provider "aws" {
  region = "us-test-1"
}

resource "aws_autoscaling_group" "bastion-private-shared-subnet-example-com" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.bastion-private-shared-subnet-example-com.id
    version = aws_launch_template.bastion-private-shared-subnet-example-com.latest_version
  }
  load_balancers        = [aws_elb.bastion-private-shared-subnet-example-com.id]
  max_size              = 1
  metrics_granularity   = "1Minute"
  min_size              = 1
  name                  = "bastion.private-shared-subnet.example.com"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "private-shared-subnet.example.com"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "bastion.private-shared-subnet.example.com"
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
    key                 = "k8s.io/role/bastion"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "bastion"
  }
  tag {
    key                 = "kubernetes.io/cluster/private-shared-subnet.example.com"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = ["subnet-abcdef"]
}

resource "aws_autoscaling_group" "master-us-test-1a-masters-private-shared-subnet-example-com" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.master-us-test-1a-masters-private-shared-subnet-example-com.id
    version = aws_launch_template.master-us-test-1a-masters-private-shared-subnet-example-com.latest_version
  }
  load_balancers        = [aws_elb.api-private-shared-subnet-example-com.id]
  max_size              = 1
  metrics_granularity   = "1Minute"
  min_size              = 1
  name                  = "master-us-test-1a.masters.private-shared-subnet.example.com"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "private-shared-subnet.example.com"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "master-us-test-1a.masters.private-shared-subnet.example.com"
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
    key                 = "kubernetes.io/cluster/private-shared-subnet.example.com"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = ["subnet-12345678"]
}

resource "aws_autoscaling_group" "nodes-private-shared-subnet-example-com" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.nodes-private-shared-subnet-example-com.id
    version = aws_launch_template.nodes-private-shared-subnet-example-com.latest_version
  }
  max_size              = 2
  metrics_granularity   = "1Minute"
  min_size              = 2
  name                  = "nodes.private-shared-subnet.example.com"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "private-shared-subnet.example.com"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "nodes.private-shared-subnet.example.com"
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
    key                 = "kubernetes.io/cluster/private-shared-subnet.example.com"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = ["subnet-12345678"]
}

resource "aws_ebs_volume" "us-test-1a-etcd-events-private-shared-subnet-example-com" {
  availability_zone = "us-test-1a"
  encrypted         = false
  iops              = 3000
  size              = 20
  tags = {
    "KubernetesCluster"                                       = "private-shared-subnet.example.com"
    "Name"                                                    = "us-test-1a.etcd-events.private-shared-subnet.example.com"
    "k8s.io/etcd/events"                                      = "us-test-1a/us-test-1a"
    "k8s.io/role/master"                                      = "1"
    "kubernetes.io/cluster/private-shared-subnet.example.com" = "owned"
  }
  throughput = 125
  type       = "gp3"
}

resource "aws_ebs_volume" "us-test-1a-etcd-main-private-shared-subnet-example-com" {
  availability_zone = "us-test-1a"
  encrypted         = false
  iops              = 3000
  size              = 20
  tags = {
    "KubernetesCluster"                                       = "private-shared-subnet.example.com"
    "Name"                                                    = "us-test-1a.etcd-main.private-shared-subnet.example.com"
    "k8s.io/etcd/main"                                        = "us-test-1a/us-test-1a"
    "k8s.io/role/master"                                      = "1"
    "kubernetes.io/cluster/private-shared-subnet.example.com" = "owned"
  }
  throughput = 125
  type       = "gp3"
}

resource "aws_elb" "api-private-shared-subnet-example-com" {
  cross_zone_load_balancing = false
  health_check {
    healthy_threshold   = 2
    interval            = 10
    target              = "SSL:443"
    timeout             = 5
    unhealthy_threshold = 2
  }
  idle_timeout = 300
  listener {
    instance_port     = 443
    instance_protocol = "TCP"
    lb_port           = 443
    lb_protocol       = "TCP"
  }
  name            = "api-private-shared-subnet-n2f8ak"
  security_groups = [aws_security_group.api-elb-private-shared-subnet-example-com.id]
  subnets         = ["subnet-abcdef"]
  tags = {
    "KubernetesCluster"                                       = "private-shared-subnet.example.com"
    "Name"                                                    = "api.private-shared-subnet.example.com"
    "kubernetes.io/cluster/private-shared-subnet.example.com" = "owned"
  }
}

resource "aws_elb" "bastion-private-shared-subnet-example-com" {
  health_check {
    healthy_threshold   = 2
    interval            = 10
    target              = "TCP:22"
    timeout             = 5
    unhealthy_threshold = 2
  }
  idle_timeout = 300
  listener {
    instance_port     = 22
    instance_protocol = "TCP"
    lb_port           = 22
    lb_protocol       = "TCP"
  }
  name            = "bastion-private-shared-su-5ol32q"
  security_groups = [aws_security_group.bastion-elb-private-shared-subnet-example-com.id]
  subnets         = ["subnet-abcdef"]
  tags = {
    "KubernetesCluster"                                       = "private-shared-subnet.example.com"
    "Name"                                                    = "bastion.private-shared-subnet.example.com"
    "kubernetes.io/cluster/private-shared-subnet.example.com" = "owned"
  }
}

resource "aws_iam_instance_profile" "bastions-private-shared-subnet-example-com" {
  name = "bastions.private-shared-subnet.example.com"
  role = aws_iam_role.bastions-private-shared-subnet-example-com.name
  tags = {
    "KubernetesCluster"                                       = "private-shared-subnet.example.com"
    "Name"                                                    = "bastions.private-shared-subnet.example.com"
    "kubernetes.io/cluster/private-shared-subnet.example.com" = "owned"
  }
}

resource "aws_iam_instance_profile" "masters-private-shared-subnet-example-com" {
  name = "masters.private-shared-subnet.example.com"
  role = aws_iam_role.masters-private-shared-subnet-example-com.name
  tags = {
    "KubernetesCluster"                                       = "private-shared-subnet.example.com"
    "Name"                                                    = "masters.private-shared-subnet.example.com"
    "kubernetes.io/cluster/private-shared-subnet.example.com" = "owned"
  }
}

resource "aws_iam_instance_profile" "nodes-private-shared-subnet-example-com" {
  name = "nodes.private-shared-subnet.example.com"
  role = aws_iam_role.nodes-private-shared-subnet-example-com.name
  tags = {
    "KubernetesCluster"                                       = "private-shared-subnet.example.com"
    "Name"                                                    = "nodes.private-shared-subnet.example.com"
    "kubernetes.io/cluster/private-shared-subnet.example.com" = "owned"
  }
}

resource "aws_iam_role" "bastions-private-shared-subnet-example-com" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_bastions.private-shared-subnet.example.com_policy")
  name               = "bastions.private-shared-subnet.example.com"
  tags = {
    "KubernetesCluster"                                       = "private-shared-subnet.example.com"
    "Name"                                                    = "bastions.private-shared-subnet.example.com"
    "kubernetes.io/cluster/private-shared-subnet.example.com" = "owned"
  }
}

resource "aws_iam_role" "masters-private-shared-subnet-example-com" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_masters.private-shared-subnet.example.com_policy")
  name               = "masters.private-shared-subnet.example.com"
  tags = {
    "KubernetesCluster"                                       = "private-shared-subnet.example.com"
    "Name"                                                    = "masters.private-shared-subnet.example.com"
    "kubernetes.io/cluster/private-shared-subnet.example.com" = "owned"
  }
}

resource "aws_iam_role" "nodes-private-shared-subnet-example-com" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_nodes.private-shared-subnet.example.com_policy")
  name               = "nodes.private-shared-subnet.example.com"
  tags = {
    "KubernetesCluster"                                       = "private-shared-subnet.example.com"
    "Name"                                                    = "nodes.private-shared-subnet.example.com"
    "kubernetes.io/cluster/private-shared-subnet.example.com" = "owned"
  }
}

resource "aws_iam_role_policy" "bastions-private-shared-subnet-example-com" {
  name   = "bastions.private-shared-subnet.example.com"
  policy = file("${path.module}/data/aws_iam_role_policy_bastions.private-shared-subnet.example.com_policy")
  role   = aws_iam_role.bastions-private-shared-subnet-example-com.name
}

resource "aws_iam_role_policy" "masters-private-shared-subnet-example-com" {
  name   = "masters.private-shared-subnet.example.com"
  policy = file("${path.module}/data/aws_iam_role_policy_masters.private-shared-subnet.example.com_policy")
  role   = aws_iam_role.masters-private-shared-subnet-example-com.name
}

resource "aws_iam_role_policy" "nodes-private-shared-subnet-example-com" {
  name   = "nodes.private-shared-subnet.example.com"
  policy = file("${path.module}/data/aws_iam_role_policy_nodes.private-shared-subnet.example.com_policy")
  role   = aws_iam_role.nodes-private-shared-subnet-example-com.name
}

resource "aws_key_pair" "kubernetes-private-shared-subnet-example-com-c4a6ed9aa889b9e2c39cd663eb9c7157" {
  key_name   = "kubernetes.private-shared-subnet.example.com-c4:a6:ed:9a:a8:89:b9:e2:c3:9c:d6:63:eb:9c:71:57"
  public_key = file("${path.module}/data/aws_key_pair_kubernetes.private-shared-subnet.example.com-c4a6ed9aa889b9e2c39cd663eb9c7157_public_key")
  tags = {
    "KubernetesCluster"                                       = "private-shared-subnet.example.com"
    "Name"                                                    = "private-shared-subnet.example.com"
    "kubernetes.io/cluster/private-shared-subnet.example.com" = "owned"
  }
}

resource "aws_launch_template" "bastion-private-shared-subnet-example-com" {
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 32
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.bastions-private-shared-subnet-example-com.id
  }
  image_id      = "ami-11400000"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.kubernetes-private-shared-subnet-example-com-c4a6ed9aa889b9e2c39cd663eb9c7157.id
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
  name = "bastion.private-shared-subnet.example.com"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    ipv6_address_count          = 0
    security_groups             = [aws_security_group.bastion-private-shared-subnet-example-com.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                          = "private-shared-subnet.example.com"
      "Name"                                                                       = "bastion.private-shared-subnet.example.com"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/bastion"                                                        = "1"
      "kops.k8s.io/instancegroup"                                                  = "bastion"
      "kubernetes.io/cluster/private-shared-subnet.example.com"                    = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                          = "private-shared-subnet.example.com"
      "Name"                                                                       = "bastion.private-shared-subnet.example.com"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/bastion"                                                        = "1"
      "kops.k8s.io/instancegroup"                                                  = "bastion"
      "kubernetes.io/cluster/private-shared-subnet.example.com"                    = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                          = "private-shared-subnet.example.com"
    "Name"                                                                       = "bastion.private-shared-subnet.example.com"
    "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
    "k8s.io/role/bastion"                                                        = "1"
    "kops.k8s.io/instancegroup"                                                  = "bastion"
    "kubernetes.io/cluster/private-shared-subnet.example.com"                    = "owned"
  }
}

resource "aws_launch_template" "master-us-test-1a-masters-private-shared-subnet-example-com" {
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
    name = aws_iam_instance_profile.masters-private-shared-subnet-example-com.id
  }
  image_id      = "ami-11400000"
  instance_type = "m3.medium"
  key_name      = aws_key_pair.kubernetes-private-shared-subnet-example-com-c4a6ed9aa889b9e2c39cd663eb9c7157.id
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
  name = "master-us-test-1a.masters.private-shared-subnet.example.com"
  network_interfaces {
    associate_public_ip_address = false
    delete_on_termination       = true
    ipv6_address_count          = 0
    security_groups             = [aws_security_group.masters-private-shared-subnet-example-com.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                                                     = "private-shared-subnet.example.com"
      "Name"                                                                                                  = "master-us-test-1a.masters.private-shared-subnet.example.com"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"                                      = "master"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"                          = ""
      "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
      "k8s.io/role/master"                                                                                    = "1"
      "kops.k8s.io/instancegroup"                                                                             = "master-us-test-1a"
      "kubernetes.io/cluster/private-shared-subnet.example.com"                                               = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                                                     = "private-shared-subnet.example.com"
      "Name"                                                                                                  = "master-us-test-1a.masters.private-shared-subnet.example.com"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"                                      = "master"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"                          = ""
      "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
      "k8s.io/role/master"                                                                                    = "1"
      "kops.k8s.io/instancegroup"                                                                             = "master-us-test-1a"
      "kubernetes.io/cluster/private-shared-subnet.example.com"                                               = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                                                     = "private-shared-subnet.example.com"
    "Name"                                                                                                  = "master-us-test-1a.masters.private-shared-subnet.example.com"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
    "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"                                      = "master"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"                          = ""
    "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
    "k8s.io/role/master"                                                                                    = "1"
    "kops.k8s.io/instancegroup"                                                                             = "master-us-test-1a"
    "kubernetes.io/cluster/private-shared-subnet.example.com"                                               = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_master-us-test-1a.masters.private-shared-subnet.example.com_user_data")
}

resource "aws_launch_template" "nodes-private-shared-subnet-example-com" {
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
    name = aws_iam_instance_profile.nodes-private-shared-subnet-example-com.id
  }
  image_id      = "ami-11400000"
  instance_type = "t2.medium"
  key_name      = aws_key_pair.kubernetes-private-shared-subnet-example-com-c4a6ed9aa889b9e2c39cd663eb9c7157.id
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
  name = "nodes.private-shared-subnet.example.com"
  network_interfaces {
    associate_public_ip_address = false
    delete_on_termination       = true
    ipv6_address_count          = 0
    security_groups             = [aws_security_group.nodes-private-shared-subnet-example-com.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                          = "private-shared-subnet.example.com"
      "Name"                                                                       = "nodes.private-shared-subnet.example.com"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes"
      "kubernetes.io/cluster/private-shared-subnet.example.com"                    = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                          = "private-shared-subnet.example.com"
      "Name"                                                                       = "nodes.private-shared-subnet.example.com"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes"
      "kubernetes.io/cluster/private-shared-subnet.example.com"                    = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                          = "private-shared-subnet.example.com"
    "Name"                                                                       = "nodes.private-shared-subnet.example.com"
    "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
    "k8s.io/role/node"                                                           = "1"
    "kops.k8s.io/instancegroup"                                                  = "nodes"
    "kubernetes.io/cluster/private-shared-subnet.example.com"                    = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_nodes.private-shared-subnet.example.com_user_data")
}

resource "aws_route53_record" "api-private-shared-subnet-example-com" {
  alias {
    evaluate_target_health = false
    name                   = aws_elb.api-private-shared-subnet-example-com.dns_name
    zone_id                = aws_elb.api-private-shared-subnet-example-com.zone_id
  }
  name    = "api.private-shared-subnet.example.com"
  type    = "A"
  zone_id = "/hostedzone/Z1AFAKE1ZON3YO"
}

resource "aws_security_group" "api-elb-private-shared-subnet-example-com" {
  description = "Security group for api ELB"
  name        = "api-elb.private-shared-subnet.example.com"
  tags = {
    "KubernetesCluster"                                       = "private-shared-subnet.example.com"
    "Name"                                                    = "api-elb.private-shared-subnet.example.com"
    "kubernetes.io/cluster/private-shared-subnet.example.com" = "owned"
  }
  vpc_id = "vpc-12345678"
}

resource "aws_security_group" "bastion-elb-private-shared-subnet-example-com" {
  description = "Security group for bastion ELB"
  name        = "bastion-elb.private-shared-subnet.example.com"
  tags = {
    "KubernetesCluster"                                       = "private-shared-subnet.example.com"
    "Name"                                                    = "bastion-elb.private-shared-subnet.example.com"
    "kubernetes.io/cluster/private-shared-subnet.example.com" = "owned"
  }
  vpc_id = "vpc-12345678"
}

resource "aws_security_group" "bastion-private-shared-subnet-example-com" {
  description = "Security group for bastion"
  name        = "bastion.private-shared-subnet.example.com"
  tags = {
    "KubernetesCluster"                                       = "private-shared-subnet.example.com"
    "Name"                                                    = "bastion.private-shared-subnet.example.com"
    "kubernetes.io/cluster/private-shared-subnet.example.com" = "owned"
  }
  vpc_id = "vpc-12345678"
}

resource "aws_security_group" "masters-private-shared-subnet-example-com" {
  description = "Security group for masters"
  name        = "masters.private-shared-subnet.example.com"
  tags = {
    "KubernetesCluster"                                       = "private-shared-subnet.example.com"
    "Name"                                                    = "masters.private-shared-subnet.example.com"
    "kubernetes.io/cluster/private-shared-subnet.example.com" = "owned"
  }
  vpc_id = "vpc-12345678"
}

resource "aws_security_group" "nodes-private-shared-subnet-example-com" {
  description = "Security group for nodes"
  name        = "nodes.private-shared-subnet.example.com"
  tags = {
    "KubernetesCluster"                                       = "private-shared-subnet.example.com"
    "Name"                                                    = "nodes.private-shared-subnet.example.com"
    "kubernetes.io/cluster/private-shared-subnet.example.com" = "owned"
  }
  vpc_id = "vpc-12345678"
}

resource "aws_security_group_rule" "from-0-0-0-0--0-ingress-tcp-22to22-bastion-elb-private-shared-subnet-example-com" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.bastion-elb-private-shared-subnet-example-com.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group_rule" "from-0-0-0-0--0-ingress-tcp-443to443-api-elb-private-shared-subnet-example-com" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.api-elb-private-shared-subnet-example-com.id
  to_port           = 443
  type              = "ingress"
}

resource "aws_security_group_rule" "from-api-elb-private-shared-subnet-example-com-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.api-elb-private-shared-subnet-example-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-api-elb-private-shared-subnet-example-com-egress-all-0to0-__--0" {
  from_port         = 0
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "-1"
  security_group_id = aws_security_group.api-elb-private-shared-subnet-example-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-bastion-elb-private-shared-subnet-example-com-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.bastion-elb-private-shared-subnet-example-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-bastion-elb-private-shared-subnet-example-com-egress-all-0to0-__--0" {
  from_port         = 0
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "-1"
  security_group_id = aws_security_group.bastion-elb-private-shared-subnet-example-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-bastion-elb-private-shared-subnet-example-com-ingress-tcp-22to22-bastion-private-shared-subnet-example-com" {
  from_port                = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.bastion-private-shared-subnet-example-com.id
  source_security_group_id = aws_security_group.bastion-elb-private-shared-subnet-example-com.id
  to_port                  = 22
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-bastion-private-shared-subnet-example-com-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.bastion-private-shared-subnet-example-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-bastion-private-shared-subnet-example-com-egress-all-0to0-__--0" {
  from_port         = 0
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "-1"
  security_group_id = aws_security_group.bastion-private-shared-subnet-example-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-bastion-private-shared-subnet-example-com-ingress-tcp-22to22-masters-private-shared-subnet-example-com" {
  from_port                = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-private-shared-subnet-example-com.id
  source_security_group_id = aws_security_group.bastion-private-shared-subnet-example-com.id
  to_port                  = 22
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-bastion-private-shared-subnet-example-com-ingress-tcp-22to22-nodes-private-shared-subnet-example-com" {
  from_port                = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.nodes-private-shared-subnet-example-com.id
  source_security_group_id = aws_security_group.bastion-private-shared-subnet-example-com.id
  to_port                  = 22
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-masters-private-shared-subnet-example-com-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.masters-private-shared-subnet-example-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-masters-private-shared-subnet-example-com-egress-all-0to0-__--0" {
  from_port         = 0
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "-1"
  security_group_id = aws_security_group.masters-private-shared-subnet-example-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-masters-private-shared-subnet-example-com-ingress-all-0to0-masters-private-shared-subnet-example-com" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.masters-private-shared-subnet-example-com.id
  source_security_group_id = aws_security_group.masters-private-shared-subnet-example-com.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-masters-private-shared-subnet-example-com-ingress-all-0to0-nodes-private-shared-subnet-example-com" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.nodes-private-shared-subnet-example-com.id
  source_security_group_id = aws_security_group.masters-private-shared-subnet-example-com.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-private-shared-subnet-example-com-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.nodes-private-shared-subnet-example-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-nodes-private-shared-subnet-example-com-egress-all-0to0-__--0" {
  from_port         = 0
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "-1"
  security_group_id = aws_security_group.nodes-private-shared-subnet-example-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-nodes-private-shared-subnet-example-com-ingress-all-0to0-nodes-private-shared-subnet-example-com" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.nodes-private-shared-subnet-example-com.id
  source_security_group_id = aws_security_group.nodes-private-shared-subnet-example-com.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-private-shared-subnet-example-com-ingress-tcp-1to2379-masters-private-shared-subnet-example-com" {
  from_port                = 1
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-private-shared-subnet-example-com.id
  source_security_group_id = aws_security_group.nodes-private-shared-subnet-example-com.id
  to_port                  = 2379
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-private-shared-subnet-example-com-ingress-tcp-2382to4000-masters-private-shared-subnet-example-com" {
  from_port                = 2382
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-private-shared-subnet-example-com.id
  source_security_group_id = aws_security_group.nodes-private-shared-subnet-example-com.id
  to_port                  = 4000
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-private-shared-subnet-example-com-ingress-tcp-4003to65535-masters-private-shared-subnet-example-com" {
  from_port                = 4003
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-private-shared-subnet-example-com.id
  source_security_group_id = aws_security_group.nodes-private-shared-subnet-example-com.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-private-shared-subnet-example-com-ingress-udp-1to65535-masters-private-shared-subnet-example-com" {
  from_port                = 1
  protocol                 = "udp"
  security_group_id        = aws_security_group.masters-private-shared-subnet-example-com.id
  source_security_group_id = aws_security_group.nodes-private-shared-subnet-example-com.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "https-elb-to-master" {
  from_port                = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-private-shared-subnet-example-com.id
  source_security_group_id = aws_security_group.api-elb-private-shared-subnet-example-com.id
  to_port                  = 443
  type                     = "ingress"
}

resource "aws_security_group_rule" "icmp-pmtu-api-elb-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 3
  protocol          = "icmp"
  security_group_id = aws_security_group.api-elb-private-shared-subnet-example-com.id
  to_port           = 4
  type              = "ingress"
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
