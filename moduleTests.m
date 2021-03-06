classdef moduleTests < matlab.unittest.TestCase 

    properties
        OriginalPath
    end

    methods(TestMethodSetup)
        function addFileToPath(testCase)
            %%Can be safely deleted! Possibly needed for future use
            %probably needs to be changed since that is in a subfolder
            %testCase.OriginalPath = path;
            %addpath(fullfile(pwd, '../'))
        end
    end

    methods(TestMethodTeardown)
        function restorePath(testCase)
            %%Can be safely deleted! Possibly needed for future use
            %path(testCase.OriginalPath)
        end
    end

    methods(Test)
        %Naming: e.g. testCoordinateAscent or testDictionaryUpdate; whatever module you are testing
        %or you can get a bit more specific, e.g. testDimensions or testADMMDimensions
        
        function testName(testCase)
            %Initialize some testvalues and run the function that is being tested as you normally would do
            %then use one of the following functions:
            %testCase.assertSize(matrix, size) e.g. assertSize(A, [10 2]);
            %testCase.assertEqual(actualSoltion, expectedSolution, 'AbsTol', 0.01)
            %For a complete list see:
            %http://www.mathworks.com/help/matlab/matlab_prog/select-qualifications.html
        end

        function testNameNew(testCase)
            %This file can have as many functions as you want
        end
    end
 end
