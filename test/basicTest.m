classdef Test1 < matlab.unittest.TestCase


	properties
		OriginalPath
	end

	methods(TestMethodSetup)
		function addFileToPath(testCase)
			%%probably needs to be changed since that is in a subfolder
			testCase.OriginalPath = path;
			addpath(fullfile(pwd, 'folderName'))
		end
	end

	methods(TestMethodTeardown)
		function restorePath(testCase)
			path(testCase.OriginalPath)
		end
	end

	methods(Test)
		function testDimensions(testCase)

			%testcase.verifySize()
			%testcase.assertSize()
			%testcase.fatalAssertSize()
			%testcase.assumeSize()
			%Differences: verify: continues the current test (softfailure)
			%assert holds the current test and runs the next test; test is marked failed and incomplete
			%fatal holds the entire test suite
			%assume: You can filter tests, they are not marked as failure
		end
	end
