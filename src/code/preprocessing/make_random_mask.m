function [x_pix, y_pix, boundary_outlines] = make_random_mask(x, y, r)

pts = linspace(0, 2*pi);

x_pix = x + r*cos(pts);
y_pix = y + r*sin(pts);

boundary_outlines = boundary(x_pix', y_pix');

end