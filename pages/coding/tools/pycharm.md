# Keyboard shortcuts

- Increase font size in all editors: Ctrl + Shift + .
- Navigating back: Cmd + `[`

## Finding actions

- Eg how to navigate back
- Shift Shift and then select the Actions tab
- Should be able to Cmd + Shift A but this started acting weirdly for me

## Configure PyCharm as a diff reporter for approval tests

- Useful when running approval tests
    - eg the lift kata: https://github.com/emilybache/Lift-Kata
- You have 3 options. Option 1 is my favourite.
- 1. Configure a diff reporter in the tests themselves:
    - See [python page](/pages/coding/lang/oo/python.md#configuring-a-diff-reporter-for-python-approval-tests)
- 2 (a and b). Configure PyCharm as a diff reporter:
    - `ps -ef | grep PyCharm`
    - Grab the path for pycharm - will be something like `/Users/claresudbery/Applications/PyCharm Community.app/Contents/MacOS/pycharm`
    - You now have two options:
    - 2a. Configure a run configuration for pytest in PyCharm:   
        - In PyCharm, select from menu Run => Edit Configurations...
        - Select "Python tests in test" on the left 
        - Use the above path instead of `PYCHARM-PATH` in the following: `--approvaltests-add-reporter-args='diff' --approvaltests-add-reporter='PYCHARM-PATH'`
        - Enter the result in the Additional Arguments field
        - Click OK
        - ! But the problem with this is that it creates a new run configuration for each test or combination of tests you run, which is why option 1 is the best!
    - 2b. Use the above path instead of `PYCHARM-PATH` in the command `python3 -m pytest --approvaltests-add-reporter-args='diff' --approvaltests-add-reporter='PYCHARM-PATH'`
        - Will look something like this: `python3 -m pytest --approvaltests-add-reporter-args='diff' --approvaltests-add-reporter='/Users/claresudbery/Applications/PyCharm Community.app/Contents/MacOS/pycharm'`
    - More info here: https://github.com/approvals/ApprovalTests.Python.PytestPlugin
        - and here: https://pypi.org/project/pytest-approvaltests/
        - Note: I tried configuring VSCode as a diff reporter, using info I found here, but I couldn't get it working: https://www.roboleary.net/vscode/2020/09/15/vscode-git.html

## Convert between snake case, camel case, etc

- Install [this plugin](https://plugins.jetbrains.com/plugin/10985-case-conversion)
- Works in Rider, Pycharm, IDEA etc (all JetBrains tools)
- Download
- Open your IDE and press ⌘ , to open the IDE settings.
- Select Plugins, click the cog and then click Install Plugin from Disk.
- Select the plugin archive file and click OK.
- Once installed:
    - Select text
    - Edit => Convert case
    - Select Plugin in plugin manager for more help