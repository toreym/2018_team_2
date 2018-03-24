# README

>Public URI = http://givedsm.org/

This website represents **The Community Foundation of Greater Des Moines**. Providing donors with a friendly way to select charitable organizations.

Users will navigate to this site by genric link on Stellar's website. Then by magic link email for their profile.
### Ruby version
**`2.2.3`**
#### System dependencies

- Ruby
- MySQL Server
- Node.js
- AWS 

####  How To Run
##### Command line commands
* Load database `rake db:migrate`
* Download/Build gems `bundle install`
* Run server from cmd `rails s`

### Deployment Instructions
1. Navigate to OpsWorks stack 
2. Click on "Deployments" on the lefthand side
3. Click "Deploy and App"
4. Ensure that "communityfoundation (railsapp)" is selected
5. Click "Deploy"

#### Debugging deploy failures
Failed deploys will be displayed in the deployment window. Locate failed deploy of choice and click on the log link. The reason the deploy failed will be highlighed in red in the log. The log may tell you that the full stack was deployed to a specific location on the deployed instance. 

To access the instance you will be need to ssh to the elastic IP for the project. 

`ssh 35.153.241.7` 

You will need to install a public key on the instance which can be managed as seen [here](https://docs.aws.amazon.com/opsworks/latest/userguide/security-ssh-access.html)
