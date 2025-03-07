locals {
  bastion_autoscaling_group_ids     = [aws_autoscaling_group.bastion-privatecalico-example-com.id]
  bastion_security_group_ids        = [aws_security_group.bastion-privatecalico-example-com.id]
  bastions_role_arn                 = aws_iam_role.bastions-privatecalico-example-com.arn
  bastions_role_name                = aws_iam_role.bastions-privatecalico-example-com.name
  cluster_name                      = "privatecalico.example.com"
  master_autoscaling_group_ids      = [aws_autoscaling_group.master-us-test-1a-masters-privatecalico-example-com.id]
  master_security_group_ids         = [aws_security_group.masters-privatecalico-example-com.id]
  masters_role_arn                  = aws_iam_role.masters-privatecalico-example-com.arn
  masters_role_name                 = aws_iam_role.masters-privatecalico-example-com.name
  node_autoscaling_group_ids        = [aws_autoscaling_group.nodes-privatecalico-example-com.id]
  node_security_group_ids           = [aws_security_group.nodes-privatecalico-example-com.id]
  node_subnet_ids                   = [aws_subnet.us-test-1a-privatecalico-example-com.id]
  nodes_role_arn                    = aws_iam_role.nodes-privatecalico-example-com.arn
  nodes_role_name                   = aws_iam_role.nodes-privatecalico-example-com.name
  region                            = "us-test-1"
  route_table_private-us-test-1a_id = aws_route_table.private-us-test-1a-privatecalico-example-com.id
  route_table_public_id             = aws_route_table.privatecalico-example-com.id
  subnet_us-test-1a_id              = aws_subnet.us-test-1a-privatecalico-example-com.id
  subnet_utility-us-test-1a_id      = aws_subnet.utility-us-test-1a-privatecalico-example-com.id
  vpc_cidr_block                    = aws_vpc.privatecalico-example-com.cidr_block
  vpc_id                            = aws_vpc.privatecalico-example-com.id
}

output "bastion_autoscaling_group_ids" {
  value = [aws_autoscaling_group.bastion-privatecalico-example-com.id]
}

output "bastion_security_group_ids" {
  value = [aws_security_group.bastion-privatecalico-example-com.id]
}

output "bastions_role_arn" {
  value = aws_iam_role.bastions-privatecalico-example-com.arn
}

output "bastions_role_name" {
  value = aws_iam_role.bastions-privatecalico-example-com.name
}

output "cluster_name" {
  value = "privatecalico.example.com"
}

output "master_autoscaling_group_ids" {
  value = [aws_autoscaling_group.master-us-test-1a-masters-privatecalico-example-com.id]
}

output "master_security_group_ids" {
  value = [aws_security_group.masters-privatecalico-example-com.id]
}

output "masters_role_arn" {
  value = aws_iam_role.masters-privatecalico-example-com.arn
}

output "masters_role_name" {
  value = aws_iam_role.masters-privatecalico-example-com.name
}

output "node_autoscaling_group_ids" {
  value = [aws_autoscaling_group.nodes-privatecalico-example-com.id]
}

output "node_security_group_ids" {
  value = [aws_security_group.nodes-privatecalico-example-com.id]
}

output "node_subnet_ids" {
  value = [aws_subnet.us-test-1a-privatecalico-example-com.id]
}

output "nodes_role_arn" {
  value = aws_iam_role.nodes-privatecalico-example-com.arn
}

output "nodes_role_name" {
  value = aws_iam_role.nodes-privatecalico-example-com.name
}

output "region" {
  value = "us-test-1"
}

output "route_table_private-us-test-1a_id" {
  value = aws_route_table.private-us-test-1a-privatecalico-example-com.id
}

output "route_table_public_id" {
  value = aws_route_table.privatecalico-example-com.id
}

output "subnet_us-test-1a_id" {
  value = aws_subnet.us-test-1a-privatecalico-example-com.id
}

output "subnet_utility-us-test-1a_id" {
  value = aws_subnet.utility-us-test-1a-privatecalico-example-com.id
}

output "vpc_cidr_block" {
  value = aws_vpc.privatecalico-example-com.cidr_block
}

output "vpc_id" {
  value = aws_vpc.privatecalico-example-com.id
}

provider "aws" {
  region = "us-test-1"
}

resource "aws_autoscaling_group" "bastion-privatecalico-example-com" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.bastion-privatecalico-example-com.id
    version = aws_launch_template.bastion-privatecalico-example-com.latest_version
  }
  load_balancers        = [aws_elb.bastion-privatecalico-example-com.id]
  max_size              = 1
  metrics_granularity   = "1Minute"
  min_size              = 1
  name                  = "bastion.privatecalico.example.com"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "privatecalico.example.com"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "bastion.privatecalico.example.com"
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
    key                 = "kubernetes.io/cluster/privatecalico.example.com"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.utility-us-test-1a-privatecalico-example-com.id]
}

resource "aws_autoscaling_group" "master-us-test-1a-masters-privatecalico-example-com" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.master-us-test-1a-masters-privatecalico-example-com.id
    version = aws_launch_template.master-us-test-1a-masters-privatecalico-example-com.latest_version
  }
  load_balancers        = [aws_elb.api-privatecalico-example-com.id]
  max_size              = 1
  metrics_granularity   = "1Minute"
  min_size              = 1
  name                  = "master-us-test-1a.masters.privatecalico.example.com"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "privatecalico.example.com"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "master-us-test-1a.masters.privatecalico.example.com"
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
    key                 = "kubernetes.io/cluster/privatecalico.example.com"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.us-test-1a-privatecalico-example-com.id]
}

resource "aws_autoscaling_group" "nodes-privatecalico-example-com" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.nodes-privatecalico-example-com.id
    version = aws_launch_template.nodes-privatecalico-example-com.latest_version
  }
  max_size              = 2
  metrics_granularity   = "1Minute"
  min_size              = 2
  name                  = "nodes.privatecalico.example.com"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "privatecalico.example.com"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "nodes.privatecalico.example.com"
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
    key                 = "kubernetes.io/cluster/privatecalico.example.com"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.us-test-1a-privatecalico-example-com.id]
}

resource "aws_ebs_volume" "us-test-1a-etcd-events-privatecalico-example-com" {
  availability_zone = "us-test-1a"
  encrypted         = false
  iops              = 3000
  size              = 20
  tags = {
    "KubernetesCluster"                               = "privatecalico.example.com"
    "Name"                                            = "us-test-1a.etcd-events.privatecalico.example.com"
    "k8s.io/etcd/events"                              = "us-test-1a/us-test-1a"
    "k8s.io/role/master"                              = "1"
    "kubernetes.io/cluster/privatecalico.example.com" = "owned"
  }
  throughput = 125
  type       = "gp3"
}

resource "aws_ebs_volume" "us-test-1a-etcd-main-privatecalico-example-com" {
  availability_zone = "us-test-1a"
  encrypted         = false
  iops              = 3000
  size              = 20
  tags = {
    "KubernetesCluster"                               = "privatecalico.example.com"
    "Name"                                            = "us-test-1a.etcd-main.privatecalico.example.com"
    "k8s.io/etcd/main"                                = "us-test-1a/us-test-1a"
    "k8s.io/role/master"                              = "1"
    "kubernetes.io/cluster/privatecalico.example.com" = "owned"
  }
  throughput = 125
  type       = "gp3"
}

resource "aws_eip" "us-test-1a-privatecalico-example-com" {
  tags = {
    "KubernetesCluster"                               = "privatecalico.example.com"
    "Name"                                            = "us-test-1a.privatecalico.example.com"
    "kubernetes.io/cluster/privatecalico.example.com" = "owned"
  }
  vpc = true
}

resource "aws_elb" "api-privatecalico-example-com" {
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
  name            = "api-privatecalico-example-0uch4k"
  security_groups = [aws_security_group.api-elb-privatecalico-example-com.id]
  subnets         = [aws_subnet.utility-us-test-1a-privatecalico-example-com.id]
  tags = {
    "KubernetesCluster"                               = "privatecalico.example.com"
    "Name"                                            = "api.privatecalico.example.com"
    "kubernetes.io/cluster/privatecalico.example.com" = "owned"
  }
}

resource "aws_elb" "bastion-privatecalico-example-com" {
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
  name            = "bastion-privatecalico-exa-hocohm"
  security_groups = [aws_security_group.bastion-elb-privatecalico-example-com.id]
  subnets         = [aws_subnet.utility-us-test-1a-privatecalico-example-com.id]
  tags = {
    "KubernetesCluster"                               = "privatecalico.example.com"
    "Name"                                            = "bastion.privatecalico.example.com"
    "kubernetes.io/cluster/privatecalico.example.com" = "owned"
  }
}

resource "aws_iam_instance_profile" "bastions-privatecalico-example-com" {
  name = "bastions.privatecalico.example.com"
  role = aws_iam_role.bastions-privatecalico-example-com.name
  tags = {
    "KubernetesCluster"                               = "privatecalico.example.com"
    "Name"                                            = "bastions.privatecalico.example.com"
    "kubernetes.io/cluster/privatecalico.example.com" = "owned"
  }
}

resource "aws_iam_instance_profile" "masters-privatecalico-example-com" {
  name = "masters.privatecalico.example.com"
  role = aws_iam_role.masters-privatecalico-example-com.name
  tags = {
    "KubernetesCluster"                               = "privatecalico.example.com"
    "Name"                                            = "masters.privatecalico.example.com"
    "kubernetes.io/cluster/privatecalico.example.com" = "owned"
  }
}

resource "aws_iam_instance_profile" "nodes-privatecalico-example-com" {
  name = "nodes.privatecalico.example.com"
  role = aws_iam_role.nodes-privatecalico-example-com.name
  tags = {
    "KubernetesCluster"                               = "privatecalico.example.com"
    "Name"                                            = "nodes.privatecalico.example.com"
    "kubernetes.io/cluster/privatecalico.example.com" = "owned"
  }
}

resource "aws_iam_role" "bastions-privatecalico-example-com" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_bastions.privatecalico.example.com_policy")
  name               = "bastions.privatecalico.example.com"
  tags = {
    "KubernetesCluster"                               = "privatecalico.example.com"
    "Name"                                            = "bastions.privatecalico.example.com"
    "kubernetes.io/cluster/privatecalico.example.com" = "owned"
  }
}

resource "aws_iam_role" "masters-privatecalico-example-com" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_masters.privatecalico.example.com_policy")
  name               = "masters.privatecalico.example.com"
  tags = {
    "KubernetesCluster"                               = "privatecalico.example.com"
    "Name"                                            = "masters.privatecalico.example.com"
    "kubernetes.io/cluster/privatecalico.example.com" = "owned"
  }
}

resource "aws_iam_role" "nodes-privatecalico-example-com" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_nodes.privatecalico.example.com_policy")
  name               = "nodes.privatecalico.example.com"
  tags = {
    "KubernetesCluster"                               = "privatecalico.example.com"
    "Name"                                            = "nodes.privatecalico.example.com"
    "kubernetes.io/cluster/privatecalico.example.com" = "owned"
  }
}

resource "aws_iam_role_policy" "bastions-privatecalico-example-com" {
  name   = "bastions.privatecalico.example.com"
  policy = file("${path.module}/data/aws_iam_role_policy_bastions.privatecalico.example.com_policy")
  role   = aws_iam_role.bastions-privatecalico-example-com.name
}

resource "aws_iam_role_policy" "masters-privatecalico-example-com" {
  name   = "masters.privatecalico.example.com"
  policy = file("${path.module}/data/aws_iam_role_policy_masters.privatecalico.example.com_policy")
  role   = aws_iam_role.masters-privatecalico-example-com.name
}

resource "aws_iam_role_policy" "nodes-privatecalico-example-com" {
  name   = "nodes.privatecalico.example.com"
  policy = file("${path.module}/data/aws_iam_role_policy_nodes.privatecalico.example.com_policy")
  role   = aws_iam_role.nodes-privatecalico-example-com.name
}

resource "aws_internet_gateway" "privatecalico-example-com" {
  tags = {
    "KubernetesCluster"                               = "privatecalico.example.com"
    "Name"                                            = "privatecalico.example.com"
    "kubernetes.io/cluster/privatecalico.example.com" = "owned"
  }
  vpc_id = aws_vpc.privatecalico-example-com.id
}

resource "aws_key_pair" "kubernetes-privatecalico-example-com-c4a6ed9aa889b9e2c39cd663eb9c7157" {
  key_name   = "kubernetes.privatecalico.example.com-c4:a6:ed:9a:a8:89:b9:e2:c3:9c:d6:63:eb:9c:71:57"
  public_key = file("${path.module}/data/aws_key_pair_kubernetes.privatecalico.example.com-c4a6ed9aa889b9e2c39cd663eb9c7157_public_key")
  tags = {
    "KubernetesCluster"                               = "privatecalico.example.com"
    "Name"                                            = "privatecalico.example.com"
    "kubernetes.io/cluster/privatecalico.example.com" = "owned"
  }
}

resource "aws_launch_template" "bastion-privatecalico-example-com" {
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
    name = aws_iam_instance_profile.bastions-privatecalico-example-com.id
  }
  image_id      = "ami-12345678"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.kubernetes-privatecalico-example-com-c4a6ed9aa889b9e2c39cd663eb9c7157.id
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
  name = "bastion.privatecalico.example.com"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    ipv6_address_count          = 0
    security_groups             = [aws_security_group.bastion-privatecalico-example-com.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                          = "privatecalico.example.com"
      "Name"                                                                       = "bastion.privatecalico.example.com"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/bastion"                                                        = "1"
      "kops.k8s.io/instancegroup"                                                  = "bastion"
      "kubernetes.io/cluster/privatecalico.example.com"                            = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                          = "privatecalico.example.com"
      "Name"                                                                       = "bastion.privatecalico.example.com"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/bastion"                                                        = "1"
      "kops.k8s.io/instancegroup"                                                  = "bastion"
      "kubernetes.io/cluster/privatecalico.example.com"                            = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                          = "privatecalico.example.com"
    "Name"                                                                       = "bastion.privatecalico.example.com"
    "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
    "k8s.io/role/bastion"                                                        = "1"
    "kops.k8s.io/instancegroup"                                                  = "bastion"
    "kubernetes.io/cluster/privatecalico.example.com"                            = "owned"
  }
}

resource "aws_launch_template" "master-us-test-1a-masters-privatecalico-example-com" {
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
    name = aws_iam_instance_profile.masters-privatecalico-example-com.id
  }
  image_id      = "ami-12345678"
  instance_type = "m3.medium"
  key_name      = aws_key_pair.kubernetes-privatecalico-example-com-c4a6ed9aa889b9e2c39cd663eb9c7157.id
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
  name = "master-us-test-1a.masters.privatecalico.example.com"
  network_interfaces {
    associate_public_ip_address = false
    delete_on_termination       = true
    ipv6_address_count          = 0
    security_groups             = [aws_security_group.masters-privatecalico-example-com.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                                                     = "privatecalico.example.com"
      "Name"                                                                                                  = "master-us-test-1a.masters.privatecalico.example.com"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"                                      = "master"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"                          = ""
      "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
      "k8s.io/role/master"                                                                                    = "1"
      "kops.k8s.io/instancegroup"                                                                             = "master-us-test-1a"
      "kubernetes.io/cluster/privatecalico.example.com"                                                       = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                                                     = "privatecalico.example.com"
      "Name"                                                                                                  = "master-us-test-1a.masters.privatecalico.example.com"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"                                      = "master"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"                          = ""
      "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
      "k8s.io/role/master"                                                                                    = "1"
      "kops.k8s.io/instancegroup"                                                                             = "master-us-test-1a"
      "kubernetes.io/cluster/privatecalico.example.com"                                                       = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                                                     = "privatecalico.example.com"
    "Name"                                                                                                  = "master-us-test-1a.masters.privatecalico.example.com"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
    "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"                                      = "master"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"                          = ""
    "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
    "k8s.io/role/master"                                                                                    = "1"
    "kops.k8s.io/instancegroup"                                                                             = "master-us-test-1a"
    "kubernetes.io/cluster/privatecalico.example.com"                                                       = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_master-us-test-1a.masters.privatecalico.example.com_user_data")
}

resource "aws_launch_template" "nodes-privatecalico-example-com" {
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
    name = aws_iam_instance_profile.nodes-privatecalico-example-com.id
  }
  image_id      = "ami-12345678"
  instance_type = "t2.medium"
  key_name      = aws_key_pair.kubernetes-privatecalico-example-com-c4a6ed9aa889b9e2c39cd663eb9c7157.id
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
  name = "nodes.privatecalico.example.com"
  network_interfaces {
    associate_public_ip_address = false
    delete_on_termination       = true
    ipv6_address_count          = 0
    security_groups             = [aws_security_group.nodes-privatecalico-example-com.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                          = "privatecalico.example.com"
      "Name"                                                                       = "nodes.privatecalico.example.com"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes"
      "kubernetes.io/cluster/privatecalico.example.com"                            = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                          = "privatecalico.example.com"
      "Name"                                                                       = "nodes.privatecalico.example.com"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes"
      "kubernetes.io/cluster/privatecalico.example.com"                            = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                          = "privatecalico.example.com"
    "Name"                                                                       = "nodes.privatecalico.example.com"
    "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
    "k8s.io/role/node"                                                           = "1"
    "kops.k8s.io/instancegroup"                                                  = "nodes"
    "kubernetes.io/cluster/privatecalico.example.com"                            = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_nodes.privatecalico.example.com_user_data")
}

resource "aws_nat_gateway" "us-test-1a-privatecalico-example-com" {
  allocation_id = aws_eip.us-test-1a-privatecalico-example-com.id
  subnet_id     = aws_subnet.utility-us-test-1a-privatecalico-example-com.id
  tags = {
    "KubernetesCluster"                               = "privatecalico.example.com"
    "Name"                                            = "us-test-1a.privatecalico.example.com"
    "kubernetes.io/cluster/privatecalico.example.com" = "owned"
  }
}

resource "aws_route" "route-0-0-0-0--0" {
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.privatecalico-example-com.id
  route_table_id         = aws_route_table.privatecalico-example-com.id
}

resource "aws_route" "route-__--0" {
  destination_ipv6_cidr_block = "::/0"
  gateway_id                  = aws_internet_gateway.privatecalico-example-com.id
  route_table_id              = aws_route_table.privatecalico-example-com.id
}

resource "aws_route" "route-private-us-test-1a-0-0-0-0--0" {
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.us-test-1a-privatecalico-example-com.id
  route_table_id         = aws_route_table.private-us-test-1a-privatecalico-example-com.id
}

resource "aws_route53_record" "api-privatecalico-example-com" {
  alias {
    evaluate_target_health = false
    name                   = aws_elb.api-privatecalico-example-com.dns_name
    zone_id                = aws_elb.api-privatecalico-example-com.zone_id
  }
  name    = "api.privatecalico.example.com"
  type    = "A"
  zone_id = "/hostedzone/Z1AFAKE1ZON3YO"
}

resource "aws_route_table" "private-us-test-1a-privatecalico-example-com" {
  tags = {
    "KubernetesCluster"                               = "privatecalico.example.com"
    "Name"                                            = "private-us-test-1a.privatecalico.example.com"
    "kubernetes.io/cluster/privatecalico.example.com" = "owned"
    "kubernetes.io/kops/role"                         = "private-us-test-1a"
  }
  vpc_id = aws_vpc.privatecalico-example-com.id
}

resource "aws_route_table" "privatecalico-example-com" {
  tags = {
    "KubernetesCluster"                               = "privatecalico.example.com"
    "Name"                                            = "privatecalico.example.com"
    "kubernetes.io/cluster/privatecalico.example.com" = "owned"
    "kubernetes.io/kops/role"                         = "public"
  }
  vpc_id = aws_vpc.privatecalico-example-com.id
}

resource "aws_route_table_association" "private-us-test-1a-privatecalico-example-com" {
  route_table_id = aws_route_table.private-us-test-1a-privatecalico-example-com.id
  subnet_id      = aws_subnet.us-test-1a-privatecalico-example-com.id
}

resource "aws_route_table_association" "utility-us-test-1a-privatecalico-example-com" {
  route_table_id = aws_route_table.privatecalico-example-com.id
  subnet_id      = aws_subnet.utility-us-test-1a-privatecalico-example-com.id
}

resource "aws_security_group" "api-elb-privatecalico-example-com" {
  description = "Security group for api ELB"
  name        = "api-elb.privatecalico.example.com"
  tags = {
    "KubernetesCluster"                               = "privatecalico.example.com"
    "Name"                                            = "api-elb.privatecalico.example.com"
    "kubernetes.io/cluster/privatecalico.example.com" = "owned"
  }
  vpc_id = aws_vpc.privatecalico-example-com.id
}

resource "aws_security_group" "bastion-elb-privatecalico-example-com" {
  description = "Security group for bastion ELB"
  name        = "bastion-elb.privatecalico.example.com"
  tags = {
    "KubernetesCluster"                               = "privatecalico.example.com"
    "Name"                                            = "bastion-elb.privatecalico.example.com"
    "kubernetes.io/cluster/privatecalico.example.com" = "owned"
  }
  vpc_id = aws_vpc.privatecalico-example-com.id
}

resource "aws_security_group" "bastion-privatecalico-example-com" {
  description = "Security group for bastion"
  name        = "bastion.privatecalico.example.com"
  tags = {
    "KubernetesCluster"                               = "privatecalico.example.com"
    "Name"                                            = "bastion.privatecalico.example.com"
    "kubernetes.io/cluster/privatecalico.example.com" = "owned"
  }
  vpc_id = aws_vpc.privatecalico-example-com.id
}

resource "aws_security_group" "masters-privatecalico-example-com" {
  description = "Security group for masters"
  name        = "masters.privatecalico.example.com"
  tags = {
    "KubernetesCluster"                               = "privatecalico.example.com"
    "Name"                                            = "masters.privatecalico.example.com"
    "kubernetes.io/cluster/privatecalico.example.com" = "owned"
  }
  vpc_id = aws_vpc.privatecalico-example-com.id
}

resource "aws_security_group" "nodes-privatecalico-example-com" {
  description = "Security group for nodes"
  name        = "nodes.privatecalico.example.com"
  tags = {
    "KubernetesCluster"                               = "privatecalico.example.com"
    "Name"                                            = "nodes.privatecalico.example.com"
    "kubernetes.io/cluster/privatecalico.example.com" = "owned"
  }
  vpc_id = aws_vpc.privatecalico-example-com.id
}

resource "aws_security_group_rule" "from-0-0-0-0--0-ingress-tcp-22to22-bastion-elb-privatecalico-example-com" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.bastion-elb-privatecalico-example-com.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group_rule" "from-0-0-0-0--0-ingress-tcp-443to443-api-elb-privatecalico-example-com" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.api-elb-privatecalico-example-com.id
  to_port           = 443
  type              = "ingress"
}

resource "aws_security_group_rule" "from-api-elb-privatecalico-example-com-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.api-elb-privatecalico-example-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-api-elb-privatecalico-example-com-egress-all-0to0-__--0" {
  from_port         = 0
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "-1"
  security_group_id = aws_security_group.api-elb-privatecalico-example-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-bastion-elb-privatecalico-example-com-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.bastion-elb-privatecalico-example-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-bastion-elb-privatecalico-example-com-egress-all-0to0-__--0" {
  from_port         = 0
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "-1"
  security_group_id = aws_security_group.bastion-elb-privatecalico-example-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-bastion-elb-privatecalico-example-com-ingress-tcp-22to22-bastion-privatecalico-example-com" {
  from_port                = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.bastion-privatecalico-example-com.id
  source_security_group_id = aws_security_group.bastion-elb-privatecalico-example-com.id
  to_port                  = 22
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-bastion-privatecalico-example-com-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.bastion-privatecalico-example-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-bastion-privatecalico-example-com-egress-all-0to0-__--0" {
  from_port         = 0
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "-1"
  security_group_id = aws_security_group.bastion-privatecalico-example-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-bastion-privatecalico-example-com-ingress-tcp-22to22-masters-privatecalico-example-com" {
  from_port                = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-privatecalico-example-com.id
  source_security_group_id = aws_security_group.bastion-privatecalico-example-com.id
  to_port                  = 22
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-bastion-privatecalico-example-com-ingress-tcp-22to22-nodes-privatecalico-example-com" {
  from_port                = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.nodes-privatecalico-example-com.id
  source_security_group_id = aws_security_group.bastion-privatecalico-example-com.id
  to_port                  = 22
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-masters-privatecalico-example-com-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.masters-privatecalico-example-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-masters-privatecalico-example-com-egress-all-0to0-__--0" {
  from_port         = 0
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "-1"
  security_group_id = aws_security_group.masters-privatecalico-example-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-masters-privatecalico-example-com-ingress-all-0to0-masters-privatecalico-example-com" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.masters-privatecalico-example-com.id
  source_security_group_id = aws_security_group.masters-privatecalico-example-com.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-masters-privatecalico-example-com-ingress-all-0to0-nodes-privatecalico-example-com" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.nodes-privatecalico-example-com.id
  source_security_group_id = aws_security_group.masters-privatecalico-example-com.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-privatecalico-example-com-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.nodes-privatecalico-example-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-nodes-privatecalico-example-com-egress-all-0to0-__--0" {
  from_port         = 0
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "-1"
  security_group_id = aws_security_group.nodes-privatecalico-example-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-nodes-privatecalico-example-com-ingress-4-0to0-masters-privatecalico-example-com" {
  from_port                = 0
  protocol                 = "4"
  security_group_id        = aws_security_group.masters-privatecalico-example-com.id
  source_security_group_id = aws_security_group.nodes-privatecalico-example-com.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-privatecalico-example-com-ingress-all-0to0-nodes-privatecalico-example-com" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.nodes-privatecalico-example-com.id
  source_security_group_id = aws_security_group.nodes-privatecalico-example-com.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-privatecalico-example-com-ingress-tcp-1to2379-masters-privatecalico-example-com" {
  from_port                = 1
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-privatecalico-example-com.id
  source_security_group_id = aws_security_group.nodes-privatecalico-example-com.id
  to_port                  = 2379
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-privatecalico-example-com-ingress-tcp-2382to4000-masters-privatecalico-example-com" {
  from_port                = 2382
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-privatecalico-example-com.id
  source_security_group_id = aws_security_group.nodes-privatecalico-example-com.id
  to_port                  = 4000
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-privatecalico-example-com-ingress-tcp-4003to65535-masters-privatecalico-example-com" {
  from_port                = 4003
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-privatecalico-example-com.id
  source_security_group_id = aws_security_group.nodes-privatecalico-example-com.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-privatecalico-example-com-ingress-udp-1to65535-masters-privatecalico-example-com" {
  from_port                = 1
  protocol                 = "udp"
  security_group_id        = aws_security_group.masters-privatecalico-example-com.id
  source_security_group_id = aws_security_group.nodes-privatecalico-example-com.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "https-elb-to-master" {
  from_port                = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-privatecalico-example-com.id
  source_security_group_id = aws_security_group.api-elb-privatecalico-example-com.id
  to_port                  = 443
  type                     = "ingress"
}

resource "aws_security_group_rule" "icmp-pmtu-api-elb-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 3
  protocol          = "icmp"
  security_group_id = aws_security_group.api-elb-privatecalico-example-com.id
  to_port           = 4
  type              = "ingress"
}

resource "aws_subnet" "us-test-1a-privatecalico-example-com" {
  availability_zone = "us-test-1a"
  cidr_block        = "172.20.32.0/19"
  tags = {
    "KubernetesCluster"                               = "privatecalico.example.com"
    "Name"                                            = "us-test-1a.privatecalico.example.com"
    "SubnetType"                                      = "Private"
    "kubernetes.io/cluster/privatecalico.example.com" = "owned"
    "kubernetes.io/role/internal-elb"                 = "1"
  }
  vpc_id = aws_vpc.privatecalico-example-com.id
}

resource "aws_subnet" "utility-us-test-1a-privatecalico-example-com" {
  availability_zone = "us-test-1a"
  cidr_block        = "172.20.4.0/22"
  tags = {
    "KubernetesCluster"                               = "privatecalico.example.com"
    "Name"                                            = "utility-us-test-1a.privatecalico.example.com"
    "SubnetType"                                      = "Utility"
    "kubernetes.io/cluster/privatecalico.example.com" = "owned"
    "kubernetes.io/role/elb"                          = "1"
  }
  vpc_id = aws_vpc.privatecalico-example-com.id
}

resource "aws_vpc" "privatecalico-example-com" {
  assign_generated_ipv6_cidr_block = true
  cidr_block                       = "172.20.0.0/16"
  enable_dns_hostnames             = true
  enable_dns_support               = true
  tags = {
    "KubernetesCluster"                               = "privatecalico.example.com"
    "Name"                                            = "privatecalico.example.com"
    "kubernetes.io/cluster/privatecalico.example.com" = "owned"
  }
}

resource "aws_vpc_dhcp_options" "privatecalico-example-com" {
  domain_name         = "us-test-1.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]
  tags = {
    "KubernetesCluster"                               = "privatecalico.example.com"
    "Name"                                            = "privatecalico.example.com"
    "kubernetes.io/cluster/privatecalico.example.com" = "owned"
  }
}

resource "aws_vpc_dhcp_options_association" "privatecalico-example-com" {
  dhcp_options_id = aws_vpc_dhcp_options.privatecalico-example-com.id
  vpc_id          = aws_vpc.privatecalico-example-com.id
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
