# OpCon job documentation SQL report
This sql query outputs OpCon schedule/job documentation.

# Prerequisites
* OpCon 15.3+
* MS SQL
* Powershell v5.1+ (for HTML Report only)

# Instructions
Run the query from SSMS or an OpCon SQL Agent job.  You will possibly need to update the first line that starts with "use opconxps" to the name of your OpCon database.

Powershell parameters (HTML Report only):
*<b>Path</b> - Path for creating the report
*<b>SQLServer</b> - Name of the sql server where the OpCon DB is stored
*<b>SQLDB</b> - Name of the OpCon db
*<b>SQLUser</b> - SQL Username
*<b>SQLPassword</b> - SQL Password
*<b>SMTP</b> - Email server (optional)
*<b>To</b> - Email address to send to (optional)
*<b>User</b> - Email user (optional)
*<b>Password</b> - Email password (optional)
*<b>Port</b> - Email server port (optional)
*<b>Subject</b> - Email subject (optional)
*<b>Body</b> - Email body (optional)

# Disclaimer
No Support and No Warranty are provided by SMA Technologies for this project and related material. The use of this project's files is on your own risk.

SMA Technologies assumes no liability for damage caused by the usage of any of the files offered here via this Github repository.

# License
Copyright 2020 SMA Technologies

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

# Contributing
We love contributions, please read our [Contribution Guide](CONTRIBUTING.md) to get started!

# Code of Conduct
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v2.0%20adopted-ff69b4.svg)](code-of-conduct.md)
SMA Technologies has adopted the [Contributor Covenant](CODE_OF_CONDUCT.md) as its Code of Conduct, and we expect project participants to adhere to it. Please read the [full text](CODE_OF_CONDUCT.md) so that you can understand what actions will and will not be tolerated.
