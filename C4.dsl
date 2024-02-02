workspace {

  model {
        group "tp"{
            paymentService = softwareSystem "درگاه پرداخت برای خرید اشتراک ویژه" {
                tags "tp"
            }
            jobWebsites = softwareSystem "سایت‌های کاریابی" {
                tags "tp"
            }
            
            smsSystem = softwareSystem  "سیستم اطلاع‌رسانی پیامکی" {
                tags "tp"
            }
            emailSystem = softwareSystem "سیستم اطلاع‌رسانی ایمیلی" {
                tags "tp"
            }
            phoneSystem = softwareSystem  "سیستم اطلاع‌رسانی تلفن گویا" {
                tags "tp"
            }
        }
        user = person "کاربر"
        
        
        system = softwareSystem "سیستم یکپارچه‌سازی آگهی‌های استخدامی" {
            tags "sysy"
            webApp = container "برنامه وب"{
                tags "Web Browser"
            }
            
            mobileApp = container "برنامه موبایل" {
                tags "Mobile App"
                Entity = component "Entities" "Core business logic and models" {
                    tags = "Entity"
                }
                UseCase = component "UseCases" "Application-specific business rules and logic" {
                    tags = "UseCase"
                }
                Repository = component "Repositories" "Abstract data access, clean API for data operations" {
                    tags = "Repository"
                }
                DataSource = component "DataSources" "Concrete data access methods" {
                    tags = "DataSource"
                }
                Framework = component "FrameworksAndDrivers" "External interfaces and frameworks" {
                    tags = "Framework"
                }
                Presentation = component "Presentation" "UI layer, responsible for displaying information and capturing user input" {
                    tags = "Presentation"
                }
                Controller = component "ControllersPresenters" "Intermediaries between UI and Use Cases" {
                    tags = "Controller"
                }
                DependencyInjection = component "DependencyInjection" "Handle injection of dependencies into various layers" {
                    tags = "DependencyInjection"
                }
                Model = component "Models" "Hold data for UI presentation" {
                    tags = "Model"
                }
                ExternalInterface = component "ExternalInterfaces" "Implement platform-specific code or external services" {
                    tags = "ExternalInterface"
                }
                Test = component "Test" "Unit tests for Use Cases, Repositories, and Entities" {
                    tags = "Test"
                }
            }
            SPA = container "Single Page Application"
            API = container "API" {
                LoginController = component "LoginController"  {
                    tags = "loginController"
                }
                ResetPassword = component "ResetPassword" "Handles reset password" {
                    tags = "resetPassword"
                }
                AuthenticationService = component "AuthenticationService"  {
                    tags = "authService"
                }
                SecurityComponent = component "SecurityComponent" {
                    tags = "securityComponent"
                }
                PaymentComponent = component "PaymentComponent"  {
                    tags = "paymentComponent"
                }
            }
            notification = container "اطلاع‌رسانی"
            analysis = container "سیستم تحلیلگر"
            DB = container "پایگاه داده اصلی"{
                tags "db"
            }
            mongoDB = container "پایگاه داده آگهی‌ها" "mongoDB"{
                tags "db"
            }
            logDB = container "پایگاه داده لاگ‌ها" {
                tags "db"
            }            
            redis = container "redis"{
                tags "db"
            }

crawler = container "خزشگر"
        }
        user -> system "جستجوی فرصت‌های شغلی"
        
        system -> paymentService "از طریق این سیستم به کاربران اطلاع‌رسانی می‌شود"
        system -> jobWebsites "آگهی‌های استخدامی از این سایت‌ها استخراج می‌شود"
        system -> emailSystem "درخواست ارسال اعلان ایمیلی"
        system -> smsSystem "درخواست ارسال اعلان پیامکی"
        system -> phoneSystem "درخواست ارسال اعلان تلفنی"
        
        user -> webApp "از طریق مرورگر به سیستم وصل شده و از آن استفاده می‌کند"
        user -> mobileApp "از طریق برنامه موبایل به سیستم وصل شده و از آن استفاده می‌کند"
        
        webApp -> SPA "از طریق این دروازه به سیستم وصل می‌شود"
        SPA -> API "فراخوانی API"
        
        API -> notification "درخواست اطلاع‌رسانی"
        API -> analysis "تحیلیل اطلاعات"
        API -> DB "ذخیره/بازیابی اطلاعات کاربران و معیار‌ها"
        API -> logDB "ثبت وقایع"
        API -> redis "cache"
        API -> mongoDB "کوئری و سرچ"
        
        analysis -> logDB "تحلیل لاگ‌ها"
        
        crawler -> mongoDB "ذخیره آگهی‌های استخراج کرده"
        
        mobileApp -> API "از طریق این دروازه به سیستم وصل می‌شود"

        UseCase -> Entity
        UseCase -> Repository
        Repository -> DataSource
        DataSource -> Framework
        Presentation -> Controller
        Controller -> UseCase
        DependencyInjection -> UseCase
        Presentation -> Model
        ExternalInterface -> DataSource
        Test  -> UseCase
        
        notification -> phoneSystem 
        notification -> emailSystem
        notification -> smsSystem
        API -> paymentService
        crawler -> jobWebsites
        
        SPA -> loginController
        mobileApp -> loginController
        loginController -> AuthenticationService
        resetPassword -> AuthenticationService
        SPA -> resetPassword
        mobileApp -> resetPassword
        resetPassword -> securityComponent
        SPA -> paymentComponent
        mobileApp -> paymentComponent
        
        
        
        Live = deploymentEnvironment "Live" {
                    deploymentNode "User Desktop"{
                        deploymentNode "Browser"{
                            containerInstance webApp 
                        }
                    }
                    
                    deploymentNode "API" {
                      containerInstance API
                    }
                    deploymentNode "server - 2" {
                      containerInstance SPA
                    }
                    deploymentNode "server - 1"{
                        containerInstance analysis
                        containerInstance crawler
                    }
                    
                    deploymentNode "server - 3"{
                        containerInstance DB
                    }
                    deploymentNode "server - 4"{
                        containerInstance logDB
                    }
                    deploymentNode "redis"{
                            containerInstance redis
                    }
                    deploymentNode "user mobile"{
                        deploymentNode "Android" "Android"{
                            containerInstance mobileApp
                            description "Android"
                        }
                        deploymentNode "ios" "ios"{
                            containerInstance mobileApp
                            description "ios"
                        }
                        
                    }
                    
            
        }
                
 
    }

 
    views {
        systemlandscape "SystemLandscape" {
            include *
            autoLayout
        }
    
        systemContext "system" {
            include *
            autoLayout lr
        }
        container system {
            include *
            autoLayout lr
        }
        
        component "mobileApp" {
            include *
            autoLayout
        }
        component "API" {
        include *
        autoLayout
        
        }

deployment * Live {
            include *
            autoLayout
        }

        dynamic "system"{
            user -> webApp "enter terms for search"
            webApp -> SPA "sends request to SPA"
            SPA -> API "sends request to API"
            API -> DB "send a query to data base"
            DB -> API "responses the query"
            API -> SPA "response to query"
            SPA -> webApp "gets respond"
            webApp -> user "shows jobs"
            
   
            autoLayout
            
        }
        styles {
        element "tp"{
            background #a6a6a6
        }
        element "Element"{
            color #ffffff
            background #4455ff
        }
            element "Person"{
                shape person
                background #a6a6a6
            }
            element "sysy"{
                color #ffffff
                background #4455ff
            }
            element "db"{
                shape cylinder
                
                
            }
            element "Web Browser" {
                shape WebBrowser
            }
            element "Mobile App" {
                shape MobileDeviceLandscape
            }
            element "Deployment"{
                color #000000
            }
                    
        }
        
    }
    
}
