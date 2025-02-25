within DistrictHeating.Components;
model Building1
  Indoor1 indoor
    annotation (Placement(transformation(extent={{22,-16},{74,32}})));
  Modelica.Fluid.Examples.HeatExchanger.BaseClasses.BasicHX HE2
    annotation (Placement(transformation(extent={{-42,-8},{-8,26}})));
  Modelica.Fluid.Sources.MassFlowSource_T massFlowRate2(
    nPorts=1,
    m_flow=0.2,
    T=360,
    redeclare package Medium = Medium,
    use_m_flow_in=true,
    use_T_in=false,
    use_X_in=false)
                annotation (Placement(transformation(extent={{-82,-12},{-62,8}})));
equation
  connect(HE2.port_b1, indoor.port_b) annotation (Line(points={{-6.3,8.66},{12,
          8.66},{12,20.72},{22.52,20.72}}, color={0,127,255}));
  connect(HE2.port_a2, indoor.port_a) annotation (Line(points={{-6.3,1.18},{12,
          1.18},{12,-3.28},{22.26,-3.28}}, color={0,127,255}));
  connect(massFlowRate2.ports[1], HE2.port_a1) annotation (Line(points={{-62,-2},
          {-48,-2},{-48,8.66},{-43.7,8.66}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Building1;
