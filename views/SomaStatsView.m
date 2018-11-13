classdef SomaStatsView < handle


    properties (SetAccess = private)
        figureHandle
    end

    methods 
        function obj = SomaStatsView(neuron)
            % SOMASTATSVIEW
            assert(isa(neuron, 'sbfsem.core.StructureAPI'),...
                'Input must be subclass of sbfsem.core.StructureAPI!');
            
            obj.createUI(neuron);
        end

    end

    methods
        function createUI(obj, neuron)
            layoutManager = sbfsem.ui.LayoutManager();

            obj.figureHandle = figure(...
                'Name', sprintf('c%u Soma Stats', neuron.ID),...
                'DefaultUicontrolFontSize', 12,...
                'DefaultUicontrolBackgroundColor', 'w',...
                'NumberTitle', 'off',...
                'Menubar', 'none',...
                'Toolbar', 'none',...
                'Color', 'w');
            figPos(obj.figureHandle, 0.4, 0.5);

            mainLayout = uix.VBox('Parent', obj.figureHandle,...
                'BackgroundColor', 'w');
            
            uicontrol(mainLayout,...
                'Style', 'text', 'String', sprintf('c%u', neuron.ID),...
                'FontSize', 14, 'FontWeight', 'bold');
            
            h = layoutManager.verticalBoxWithLabel(...
                mainLayout, 'Soma Radius:',...
                'Style', 'text',...
                'String', sprintf('%.3f', neuron.getSomaSize));
            set(h, 'FontWeight', 'bold');
            
            h = layoutManager.verticalBoxWithLabel(...
                mainLayout, 'Soma ID:',...
                'Style', 'text',...
                'String', sprintf('%u', neuron.getSomaID));
            set(h, 'FontWeight', 'bold');
            
            h = layoutManager.verticalBoxWithLabel(...
                mainLayout, 'Soma Depth:',...
                'Style', 'text',...
                'String', 'Not yet implemented');
            set(h, 'FontWeight', 'bold');

            set(mainLayout, 'Heights', [-0.65, -1, -1 ,-1]);
        end
    end
end