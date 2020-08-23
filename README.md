# MEDIUM MMV TABLEVIEW

## We will be building a simple application using the MVVM design pattern

## Class Diagram
![diagram](https://github.com/viktorHbenitez/MEDIUM_MMV_TABLEVIEW/blob/master/sketch/MVVM_IOS_API.jpg)  

##  API Service 
We are feching employee data using URLSession class.We will calle the API Service Class  


## Dummy web service
We will be consuming a dummy web service 

[Dummy] (http://dummy.restapiexample.com/api/v1/employees)  

### Create the bussines logic and test our API service
**Note:**

```swift
// App Transport Security Settings

<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
    <key>NSExceptionDomains</key>
    <dict>
        <key>example.com</key>
        <dict>
            <key>NSExceptionAllowsInsecureHTTPLoads</key>
            <true/>
            <key>NSIncludesSubdomains</key>
            <true/>
        </dict>
    </dict>
</dict>

```







