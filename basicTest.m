classdef basicTest < matlab.unittest.TestCase
    

	properties
		OriginalPath
	end

	methods(TestMethodSetup)
		function addFileToPath(testCase)
			%%probably needs to be changed since that is in a subfolder
			%testCase.OriginalPath = path;
			%addpath(fullfile(pwd, '../'))
		end
    end

	methods(TestMethodTeardown)
		function restorePath(testCase)
			%path(testCase.OriginalPath)
		end
	end

	methods(Test)
		function testDimensions(testCase)
            beta0 = 1; beta = [1 1 1 1 0 0 0 0]';
            N=100;
            p = length(beta);
            x = rand(N, p);
            y = beta0 + x*beta;
            [beta0, beta] = coordAscentENet(y, x, 0.1, 0, {});
            testCase.assertSize(beta, [p 1]);
			%testcase.verifySize() testcase.assertSize()
			%testcase.fatalAssertSize() testcase.assumeSize() Differences:
			%verify: continues the current test (softfailure) assert holds
			%the current test and runs the next test; test is marked failed
			%and incomplete fatal holds the entire test suite assume: You
			%can filter tests, they are not marked as failure
        end
    end
 end
