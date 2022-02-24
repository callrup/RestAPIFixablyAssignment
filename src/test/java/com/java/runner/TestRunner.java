package com.java.runner;

import java.io.File;

import org.junit.AfterClass;
import org.junit.runner.RunWith;

import com.java.utilities.FileReaderManager;
import com.vimalselvam.cucumber.listener.Reporter;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;


@RunWith(Cucumber.class)
@CucumberOptions(features = "src/test/java/resources/features/",
glue="com.java.stepdefs",
dryRun= false, 
strict=false,
monochrome=true,
tags= {"@RunEndToEndTest"},
plugin ={"com.aventstack.extentreports.cucumber.adapter.ExtentCucumberAdapter:"}//{"com.cucumber.listener.ExtentCucumberFormatter:target/cucumber-reports/report.html"} //{"com.aventstack.extentreports.cucumber.adapter.ExtentCucumberAdapter:RestAssured/target/html/ExtentReport.html"}
)
public class TestRunner {

	@AfterClass
	public static void createExtentReport()
	{
	Reporter.loadXMLConfig(new File(FileReaderManager.getInstance().getConfigReader().getReportConfigPath()));
	//Reporter.loadXMLConfig(new File("src/test/java/resources/extent-config.xml"));
	Reporter.setSystemInfo("Test User", System.getProperty("user.name"));
	Reporter.setSystemInfo("User Name", "Rupam");
	Reporter.setSystemInfo("Application Name", "Test App ");
	Reporter.setSystemInfo("Operating System Type", System.getProperty("os.name").toString());
	Reporter.setSystemInfo("Environment", "Test");
	Reporter.setTestRunnerOutput("Test Execution Cucumber Report");
	}
}

