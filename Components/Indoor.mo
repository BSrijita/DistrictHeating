within DistrictHeating.Components;
model Indoor
  Course2024Modelica_students.Day2.SimpleHouse.Components.Radiator radiator
    annotation (Placement(transformation(extent={{-18,-16},{20,18}})));
  Modelica.Fluid.Sources.Boundary_pT  watSink(redeclare package Medium =
        Buildings.Media.Water, nPorts=1)
    annotation (Placement(transformation(extent={{84,-10},{64,10}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort  temperature(redeclare package
      Medium = Buildings.Media.Water, m_flow_nominal=0.0027)
    annotation (Placement(transformation(extent={{32,-10},{52,10}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium =
        Buildings.Media.Water) annotation (Placement(transformation(extent={{
            -122,-20},{-80,22}}), iconTransformation(extent={{-120,-68},{-78,
            -26}})));
equation
  connect(temperature.port_b, watSink.ports[1])
    annotation (Line(points={{52,0},{64,0}}, color={0,127,255}));
  connect(radiator.port_return, temperature.port_a)
    annotation (Line(points={{20,1},{20,0},{32,0}}, color={0,127,255}));
  connect(port_a, radiator.port_supply)
    annotation (Line(points={{-101,1},{-18,1}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={196,234,156},
          fillPattern=FillPattern.Solid), Text(
          extent={{-62,38},{70,-24}},
          textColor={0,0,0},
          textString="Indoor")}), Diagram(coordinateSystem(preserveAspectRatio=
            false)));
end Indoor;
