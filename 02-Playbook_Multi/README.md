# Apache Solr Installation

This automates the installation of [Apache Solr](https://lucene.apache.org/solr/) (Search Platform similar to [Algolia](https://www.algolia.com/))

Prerequisite:
+ [Terraform](https://www.terraform.io/)
+ [AWS Account](https://aws.amazon.com/)
+ [Ansible](https://www.ansible.com/)

```
cd Terrafrom/
terraform init
terrafrom apply
ansible-playbook -i inventory main.yaml


# After Creating 
terraform destroy # To delete all the aws resources
```
