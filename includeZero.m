function h = includeZero(varargin)
%INCLUDEZERO Include the [0 0] coordinates in a plot
%   includeZero() makes sure the plot will always show [0 0] by plotting an
%   invisible point.
%
%   h = includeZero() returns the handle to the invisible point.
%
%   includeZero(x, y) overrules the coordinates for the invisible point.

    % Check current status of ishold and set hold to on
    currIshold = ishold();
    hold('on');

    % Handle input/output
    p = inputParser();
    p.addOptional('x', 0);
    p.addOptional('y', 0);
    p.parse(varargin{:});
    p = p.Results;
    
    % Plot the point and make it invisible
    h = plot(p.x, p.y, '.w');
    set(h, 'LineStyle', 'none', 'Marker', 'none');
    
    % Prevent a legend entry
    set(get(get(h, 'Annotation'), 'LegendInformation'), 'IconDisplayStyle', 'off');
    
    % Set hold to off if it originally was
    if ~currIshold
        hold('off');
    end

end
