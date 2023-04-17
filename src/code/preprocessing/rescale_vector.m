function rescaled = rescale_vector(vector, new_min, new_max, old_min, old_max)

rescaled = new_min + ((vector - old_min)*(new_max - new_min))/(old_max-old_min);

end