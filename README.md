# tdlib

Builds Tdlib via Github actions on Mac,Ubuntu and Windows. Binaries are tagged as an artifact in the respective action. Windows is the exception:


##note for maintainers
possibly a new version of tdlib might me released in the future for a new schena. If this is the case, edit the workflow files as well as the windows docker file to check out the newer tag.
The windows docker workflow will fail until either the swa department creates a windows runner as windows docker files can only be created on windows. otherwise simply build the docker file, run an interactive session to run C:/build.ps1 and copy the outputfiles in C:/td/release. This is as good as it gets, as we can not automate windows build.
