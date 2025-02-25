within DistrictHeating.Components;
model Indoor1
  Modelica.Fluid.Examples.HeatExchanger.BaseClasses.BasicHX HE2(redeclare
      package Medium_1 = Modelica.Media.Water.StandardWater, redeclare package
      Medium_2 = Modelica.Media.Water.StandardWater)
    annotation (Placement(transformation(extent={{-22,6},{12,40}})));
  Modelica.Fluid.Sources.Boundary_pT Return(redeclare package Medium =
        Modelica.Media.Water.StandardWater, nPorts=1)
    annotation (Placement(transformation(extent={{62,-8},{42,12}})));
  Modelica.Fluid.Sources.Boundary_pT Supply(redeclare package Medium =
        Modelica.Media.Water.StandardWater, nPorts=1)
    annotation (Placement(transformation(extent={{60,36},{40,56}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium =
        Modelica.Media.Water.StandardWater) annotation (Placement(
        transformation(extent={{-120,-68},{-78,-26}}), iconTransformation(
          extent={{-120,-68},{-78,-26}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium =
        Modelica.Media.Water.StandardWater) annotation (Placement(
        transformation(extent={{-118,32},{-78,74}}), iconTransformation(extent=
            {{-118,32},{-78,74}})));
equation
  connect(port_a, HE2.port_a1) annotation (Line(points={{-99,-47},{-30,-47},{
          -30,22.66},{-23.7,22.66}}, color={0,127,255}));
  connect(HE2.port_b1, Supply.ports[1]) annotation (Line(points={{13.7,22.66},{
          34,22.66},{34,46},{40,46}}, color={0,127,255}));
  connect(Return.ports[1], HE2.port_a2) annotation (Line(points={{42,2},{18,2},
          {18,15.18},{13.7,15.18}}, color={0,127,255}));
  connect(HE2.port_b2, port_b) annotation (Line(points={{-23.7,30.82},{-72,
          30.82},{-72,53},{-98,53}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{-100,100},{102,-100}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={196,234,156}), Text(
          extent={{-54,42},{52,-24}},
          textColor={0,0,0},
          textString="Indoor")}),                                Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Indoor1;
