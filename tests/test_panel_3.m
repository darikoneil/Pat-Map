function [app] = test_panel_3()

app = test_panel_1();

app = test_panel_2(app);

perform_parameter_estimation_button_pushed(app);

preview_parameter_estimation_button_pushed(app);

add_p_lambda_button_pushed(app);

learn_additional_parameter_estimation_button_pushed(app);

end
