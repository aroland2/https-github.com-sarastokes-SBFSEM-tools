classdef GCLBoundary < sbfsem.core.BoundaryMarker
	

	methods
		function obj = GCLBoundary(source, fromCache)
			obj@sbfsem.core.BoundaryMarker(source);
			obj.TYPEID = 235;

			if nargin < 2
				fromCache = true;
			end

            if fromCache
            	obj.loadMarkers();
            else
	            obj.update();
    	    end
    	    obj.doAnalysis(200);
		end
	end

	methods (Access = private)
		function loadMarkers(obj)
        	parentDir = fileparts(fileparts(fileparts(mfilename('fullpath'))));
        	fpath = [filesep, 'data', filesep, upper(obj.source), '_GCL.txt'];
        	obj.setLocations(dlmread([parentDir, fpath]));
		end
	end
end