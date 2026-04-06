Robot Framework

https://docs.robotframework.org/docs/getting_started/ide
https://chrisjhart.com/Robot-Framework-Syntax-Cheat-Sheet/
https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html

>>> Install extensions for vscode:

https://marketplace.visualstudio.com/items?itemName=d-biehl.robotcode
https://marketplace.visualstudio.com/items?itemName=robotframeworkbambouna.vscode-rf-bam-formatter

>>> Docs: 

BDD: https://docs.robotframework.org/docs/testcase_styles/bdd
DD: https://docs.robotframework.org/docs/testcase_styles/datadriven
RIDE Editor: https://github.com/robotframework/RIDE/wiki/Installation-Instructions


UI Testing: https://marketsquare.github.io/robotframework-browser/Browser.html
API Request: https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html
Built In: https://robotframework.org/robotframework/latest/libraries/BuiltIn.html

>>> Start ride application: 

$ ./.venv/Scripts/ride

>>> Setup:

$ py -m venv .venv

$ source ./.venv/Scripts/activate

$ node --version
$ npm --version

MacOS:

$ pip install robotframework robotframework-requests robotframework-robocop

Or:

$ pip install -r requirements.txt

$ rfbrowser init

---

$ robot -T --loglevel DEBUG -d results/ --include calculator suites/.
$ robot -T --loglevel DEBUG -d results/ --include a --include b suites/.

$ python -m robot.libdoc ./libs/calculator.py ./docs/calculator.html