# RobotFramework_APIAutomation_PythonProject
This is API-Automation Python Project using RobotFramework.

Here we will automate below Request-Types =>
1) GET - Retrive Data from API Service/Server
2) POST - Create new request/data to API Service/Server
3) PUT - Update existing request/data from API Service/Server - Need to send all required fields.
4) DELETE - Delete existing request/data from API Service/Server
5) PATCH - Update existing request/data - only need to send updated data.


# Requirement for RobotFramework - APIAutomation
1) Python 
2) IDE - VS Code, Pycharm, Eclipse etc.
3) Libraries
   1) PIP
   2) RobotFramework - pip install robotframework
   3) SeleniumLibrary - pip install SeleniumLibrary
   4) Intellibot Plugin
   5) Requests Library =>
      robotframework-request - pip install robotframework-requests
      requests - pip install requests
   7) Robotframework-jsonlibrary - 
      pip install jsonpath_rw
      pip install jsonpath_rw_ext
      pip install robotframework-jsonlibrary 
      If above command doesn't work follow below steps
      i) Download ZIP Library from https://github.com/nottyo/robotframework-jsonlibrary
      ii) Unzip the above jsonlibrary
      iii) Edit "__init__.py" file from "JSONLibrary" folder. Replace the first 2 import lines with below -
           from JSONLibrary.JSONLibraryKeywords import JSONLibraryKeywords
           from JSONLibrary.version import VERSION
      iv) Edit "JSONLibraryKeywords.py" from from "JSONLibrary" folder. Replace line-4 with below line -
          from JSONLibrary.version import VERSION
      v) Run below PIP command to apply the JSONLibrary
         pip install "---PATH---\robotframework-jsonlibrary-master"
  
      
      
      
      
      
 # Documentation ==>
 1) https://github.com/MarketSquare/robotframework-requests
 2) https://robotframework-thailand.github.io/robotframework-jsonlibrary/
 3) https://robotframework-thailand.github.io/robotframework-jsonlibrary/JSONLibrary.html
 4) 
