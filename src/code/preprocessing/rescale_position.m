function rescaled_position = rescale_position(position, new_min, new_max, old_min, old_max)

rescaled_position = new_min + ((position - old_min)*(new_max - new_min))/(old_max-old_min);

end