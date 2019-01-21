# Creating a new Email/Outage notification for your client
###### Edit `options/options.pug` and create a new statement
```pug
if project == "npj" //- Project Acronym
  - var name    = "New Project"
  - var url     = "http://newproject/absolute-url-logo.png"
  - var width   = "100" //- Logo width
  - var height  = "50" //- Logo height
  - var inverse = false
```
###### Set inverse to `true` to have background color if the logo is not visible on a white background.
```pug
- var inverse = true
```
###### Don't forget to add the style to set the background color and padding
```pug
- var style   = { background: "#41bb72", padding: "10px" }
```
###### Edit `compile.sh` and add the project folder name in the `folder` array variable
```sh
# Array of folder names.
folder=(af bc cl dp fe fmc gs hr mhp ms nu pd pi rp tq wc hp ge am wmu ins mb cx td piq adv npj)
```

# Serve Email/Outage notifications in Netlify
1. Create a [Netlify](https://www.netlify.com/) account
2. Click on the `New site from Git` button
3. Under `Continuous Deployment` select `Github` button. A popup will appear and you have to authorize your Github account and select a repository. You can select all or just select a specific repository.
4. In the list of repositories, select `/outage`
5. Under `Build command` put `make netlify`. This will run a `make` file that will install `pug-cli` and run the `compile.sh`
6. Under `Publish directory` put `html`. Netlify will serve the outages in this directory.
7. Click `Deploy Site` button.

###### After the site goes live you can now access the following
**Devops**

`https://[projectnameinnetlify].netlify.com/[project acronym]/t_devops.html`

**Regression**

`https://[projectnameinnetlify].netlify.com/[project acronym]/t_regression.html`

**Runsheet 2**

`https://[projectnameinnetlify].netlify.com/[project acronym]/t_runsheet_2.html`

**Runsheet**

`https://[projectnameinnetlify].netlify.com/[project acronym]/t_runsheet.html`

**Smoke Pre-release**

`https://[projectnameinnetlify].netlify.com/[project acronym]/t_smoke_pre_release.html`

**Smoke**

`https://[projectnameinnetlify].netlify.com/[project acronym]/t_smoke.html`
