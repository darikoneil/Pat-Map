classdef BCFWObjective < handle
    % BCFWObjective  Interface for block-coordinate Frank Wolfe problems.
    % Thread-safe
    
    properties
        M, xwavg
    end
    
    methods (Abstract)        

        step_size = line_search(th, dir, max_step);
        
        step_size_m = line_search_block(th, m, dir, max_step);
        
        [s, duality_gap] = solve_lp(th);
        
        sm = solve_lp_block(th);
        
        err = training_error(th);
    end
    
    methods (Abstract, Access = protected)
        y = ix(th, m);                 % access indices for block m       
        update_intermediate_values(th); % called after x changes
    end
    
    methods
        function move_x(th, step_size, dir)
            th.x = th.x + step_size*dir;
            th.update_intermediate_values();            
        end
        
        function move_x_block(th, m, step_size, dir)
            th.x(th.ix(m)) = th.x(th.ix(m)) + step_size*dir;
            th.update_intermediate_values();
        end
        
        function xm = get_x_block(th, m)
            xm = th.x(th.ix(m));
        end
        
    end
    
end

