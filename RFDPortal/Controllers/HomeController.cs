using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.Management.Compute.Fluent;
using Microsoft.Azure.Management.Compute.Fluent.Models;
using Microsoft.Azure.Management.Fluent;
using Microsoft.Azure.Management.ResourceManager.Fluent;
using Microsoft.Azure.Management.ResourceManager.Fluent.Core;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;
using Microsoft.Azure.Management.ResourceManager.Fluent.Authentication;
using Microsoft.AspNetCore.Hosting;

namespace RFDPortal.Controllers
{
    public class HomeController : Controller
    {
        AzureCredentials credentials;
        IAzure azure;
        string groupName = "allinazure";
        IResourceGroup resourceGroup;
        public IActionResult Index()
        {
            
            return View();
        }

        public HomeController(IHostingEnvironment env)
        {
            
            IHostingEnvironment _env = env;

            credentials = SdkContext.AzureCredentialsFactory.FromFile(_env.WebRootPath+"/azureauth.properties");
            azure = Azure
                .Configure()
                .WithLogLevel(HttpLoggingDelegatingHandler.Level.Basic)
                .Authenticate(credentials)
                .WithDefaultSubscription();

            resourceGroup = azure.ResourceGroups.GetByName(groupName);

                
        }

        private bool DeployTemplate(int templateNumber)
        {
            var templatePath = "https://allinazure.blob.core.windows.net/scripts/hpc-scaleset.json";
            var paramPath = "https://allinazure.blob.core.windows.net/scripts/azuredeploy.parameters.json";
           
            var deployment = azure.Deployments.Define("myDeployment")
                .WithExistingResourceGroup(groupName)
                .WithTemplateLink(templatePath, "1.0.0.0")
                .WithParametersLink(paramPath, "1.0.0.0")
                .WithMode(Microsoft.Azure.Management.ResourceManager.Fluent.Models.DeploymentMode.Incremental)
                .Create();
            return true;
        }

        




        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }

        public IActionResult Error()
        {
            return View();
        }
    }
}
