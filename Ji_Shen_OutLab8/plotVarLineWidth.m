function PlotVarLineWidth( x, y, line_width, color )
%plotVarLine plots y vs. x of the specified line width and color
%   Input: x, y data points
%          line_width the width of the line of use
%          color an RGB color

h = plot(x, y);
set(h, 'LineWidth', line_width, 'Color', color);


end

