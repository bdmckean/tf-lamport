# Terrafrom for lamport on AWS

This is my development area for developing terraform to deploy a three node lamport cluster to AWS

Not sure what orchestration packacge I will use yet

This project is simply to setup and deploy the three nodes ande make them usable.


## Terraform
###Finding Terraform:
https://www.terraform.io/

###Setting up your environment:
https://www.terraform.io/intro/getting-started/install.html

Note that terraform will setup everything in the current directory.
Keep only files for one setup in the directory 
Use "terraform plan" to see what it will set up


## AWS
###Setting up account on AWS:
http://docs.aws.amazon.com/AmazonSimpleDB/latest/DeveloperGuide/AboutAWSAccounts.html

Note: 
You can use a free tier

###Setting up AWS key pairs
http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html


/*
    Copyright {2016} {Brian McKean}

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

*/
