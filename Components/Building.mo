within DistrictHeating.Components;
model Building


// Parameters

  parameter Modelica.SIunits.Temperature T_set = 293.15 "Indoor setpoint temperature (K)";
  parameter Modelica.SIunits.Capacitance C = 1e6 "Thermal capacitance of building (J/K)";
  parameter Modelica.SIunits.ThermalResistance R = 0.1 "Thermal resistance of building (K/W)";
  Modelica.SIunits.Temperature T_indoor(start=T_start);
  Modelica.SIunits.HeatFlowRate Q_secondary;



  Modelica.Blocks.Sources.Constant Constant(k=T_set)
    annotation (Placement(transformation(extent={{-130,-6},{-106,18}})));


  Buildings.HeatTransfer.Sources.PrescribedTemperature SetPointTemp
    annotation (Placement(transformation(extent={{-74,-8},{-46,20}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor thermalMass(C=C, T(
        start=293.15))
    annotation (Placement(transformation(extent={{46,16},{82,52}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor thermalResistor(R=R)
    annotation (Placement(transformation(extent={{-6,-10},{26,22}})));
equation


  connect(thermalResistor.port_b, thermalMass.port)
    annotation (Line(points={{26,6},{64,6},{64,16}},        color={191,0,0}));
  connect(Constant.y, SetPointTemp.T)
    annotation (Line(points={{-104.8,6},{-76.8,6}},     color={0,0,127}));
  connect(SetPointTemp.port, thermalResistor.port_a)
    annotation (Line(points={{-46,6},{-6,6}},     color={191,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-160,-140},
            {160,100}}), graphics={Rectangle(
          extent={{-160,100},{160,-140}},
          lineColor={0,0,0},
          fillColor={186,71,96},
          fillPattern=FillPattern.Sphere)}),                     Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-160,-140},{160,100}})));
end Building;
