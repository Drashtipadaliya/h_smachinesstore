<%@ Application Language="C#" %>

<script runat="server">

  
        // Code that runs on application startup
        protected void Application_Start(object sender, EventArgs e)
{
    // Add ScriptResourceMapping for jQuery
    ScriptManager.ScriptResourceMapping.AddDefinition(
        "jquery",
        new ScriptResourceDefinition
        {
            Path = "~/Scripts/jquery-3.6.0.min.js", // Path to your jQuery file
            DebugPath = "~/Scripts/jquery-3.6.0.js", // Optional: Path to your unminified version
            CdnPath = "https://code.jquery.com/jquery-3.6.0.min.js", // Optional: CDN Path
            CdnDebugPath = "https://code.jquery.com/jquery-3.6.0.js", // Optional: CDN Debug Path
            CdnSupportsSecureConnection = true,
            LoadSuccessExpression = "window.jQuery" // Check if jQuery is loaded successfully
        });


    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
