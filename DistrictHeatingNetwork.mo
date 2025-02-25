within DistrictHeating;
model DistrictHeatingNetwork "District heating network"
  extends Modelon.Icons.Experiment;
  replaceable package Medium =
      Modelon.Media.PreDefined.Liquids.ConstantPropertyWater;
  parameter Integer n_consumers=125;
  parameter Modelica.Units.SI.Temperature T_supply=343.15;
  parameter Modelica.Units.SI.HeatFlowRate[49] Q_consumer=1000*{303,286,293,289,294,326,461,745,701,373,278,273,270,262,245,322,404,432,502,526,438,346,317,338,324,314,305,312,299,335,468,765,805,555,500,466,520,456,338,396,386,549,688,598,346,354,302,287,272};
  Modelica.Units.SI.HeatFlowRate Q_demand=subSystem.loadProfile.heatload[1]*n_consumers;

  .ThermalPower.SubComponents.Deprecated.DistrictHeating.Consumers.System_10Consumers subSystem(
    redeclare package Medium = Medium,
    T_supply=T_supply,
    N_B_return=3,
    N_B_supply=3,
    Q_consumer=Q_consumer) annotation (Placement(transformation(extent={{-70,-30},{-50,-10}})));
  ThermalPower.SubComponents.Deprecated.DistrictHeating.Producers.IdealProducer_dp cogenerationPlant(
    use_T_in=true,
    use_dp_in=true,
    redeclare package Medium = Medium) annotation (Placement(transformation(extent={{-100,-22},{-80,-2}})));
  inner ThermalPower.System_TPL system_TPL(use_T_ambient_in=true, n_consumers=
        125) annotation (Placement(transformation(
        extent={{110,70},{130,90}},
        rotation=0.0,
        origin={0.0,0.0})));
  ThermalPower.Experiments.SubComponents.Control.DistrictHeatingPressureControl
    control annotation (Placement(transformation(extent={{-130,-20},{-110,0}})));
  .ThermalPower.SubComponents.Deprecated.DistrictHeating.Consumers.System_10Consumers subSystem1(
    N_B_return=2,
    N_B_supply=2,
    redeclare package Medium = Medium,
    i_subsystem=11,
    T_supply=T_supply,
    Q_consumer=Q_consumer) annotation (Placement(transformation(extent={{-30,10},{-10,30}})));
  .ThermalPower.SubComponents.Deprecated.DistrictHeating.Consumers.System_5Consumers subSystem3(
    redeclare package Medium = Medium,
    i_subsystem=21,
    T_supply=T_supply,
    Q_consumer=Q_consumer) annotation (Placement(transformation(extent={{60,10},{80,30}})));
  .ThermalPower.SubComponents.Deprecated.DistrictHeating.Consumers.System_10Consumers subSystem2(
    N_B_return=2,
    N_B_supply=2,
    redeclare package Medium = Medium,
    i_subsystem=26,
    T_supply=T_supply,
    Q_consumer=Q_consumer) annotation (Placement(transformation(extent={{-30,-60},{-10,-40}})));
  .ThermalPower.SubComponents.Deprecated.DistrictHeating.Consumers.System_10Consumers subSystem4(
    N_B_return=2,
    N_B_supply=2,
    redeclare package Medium = Medium,
    i_subsystem=36,
    T_supply=T_supply,
    Q_consumer=Q_consumer) annotation (Placement(transformation(extent={{0,-60},{20,-40}})));
  .ThermalPower.SubComponents.Deprecated.DistrictHeating.Consumers.System_5Consumers subSystem5(
    redeclare package Medium = Medium,
    i_subsystem=46,
    T_supply=T_supply,
    Q_consumer=Q_consumer) annotation (Placement(transformation(extent={{0,-92},{20,-72}})));
  .ThermalPower.SubComponents.Deprecated.DistrictHeating.Consumers.System_5Consumers subSystem6(
    redeclare package Medium = Medium,
    i_subsystem=51,
    T_supply=T_supply,
    Q_consumer=Q_consumer) annotation (Placement(transformation(extent={{60,-60},{80,-40}})));
  .ThermalPower.SubComponents.Deprecated.DistrictHeating.Consumers.System_10Consumers subSystem7(
    N_B_return=2,
    N_B_supply=2,
    redeclare package Medium = Medium,
    i_subsystem=56,
    T_supply=T_supply,
    Q_consumer=Q_consumer) annotation (Placement(transformation(extent={{-90,40},{-70,60}})));
  .ThermalPower.SubComponents.Deprecated.DistrictHeating.Consumers.System_10Consumers subSystem8(
    N_B_return=1,
    N_B_supply=1,
    redeclare package Medium = Medium,
    i_subsystem=66,
    T_supply=T_supply,
    Q_consumer=Q_consumer) annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  .ThermalPower.SubComponents.Deprecated.DistrictHeating.Consumers.System_5Consumers subSystem9(
    redeclare package Medium = Medium,
    i_subsystem=76,
    T_supply=T_supply,
    Q_consumer=Q_consumer) annotation (Placement(transformation(extent={{-60,70},{-40,90}})));
  .ThermalPower.SubComponents.Deprecated.DistrictHeating.Consumers.System_10Consumers subSystem10(
    redeclare package Medium = Medium,
    i_subsystem=81,
    N_B_return=2,
    N_B_supply=2,
    T_supply=T_supply,
    Q_consumer=Q_consumer) annotation (Placement(transformation(extent={{-30,40},{-10,60}})));
  .ThermalPower.SubComponents.Deprecated.DistrictHeating.Consumers.System_10Consumers subSystem11(
    redeclare package Medium = Medium,
    i_subsystem=91,
    T_supply=T_supply,
    Q_consumer=Q_consumer,
    N_B_supply=1,
    N_B_return=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={40,50})));
  .ThermalPower.SubComponents.Deprecated.DistrictHeating.Consumers.System_5Consumers subSystem14(
    redeclare package Medium = Medium,
    i_subsystem=121,
    T_supply=T_supply,
    Q_consumer=Q_consumer) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={130,50})));
  .ThermalPower.SubComponents.Deprecated.DistrictHeating.Consumers.System_10Consumers subSystem13(
    redeclare package Medium = Medium,
    i_subsystem=111,
    N_B_supply=1,
    N_B_return=1,
    T_supply=T_supply,
    Q_consumer=Q_consumer) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={100,50})));
  .ThermalPower.SubComponents.Deprecated.DistrictHeating.Consumers.System_10Consumers subSystem12(
    redeclare package Medium = Medium,
    i_subsystem=101,
    N_B_supply=1,
    N_B_return=1,
    T_supply=T_supply,
    Q_consumer=Q_consumer) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={70,50})));
  Modelica.Blocks.Sources.Step step_T_supply(
    height=5,
    offset=T_supply,
    startTime=86400) annotation (Placement(transformation(extent={{-130,-50},{-110,-30}})));
  ThermalPower.SubComponents.Deprecated.DistrictHeating.SubComponents.SolarPlant solarPlant(redeclare
      package Medium =                                                                                                 Medium, T0
      =358.15)                                                                                                                            annotation (Placement(transformation(extent={{0,70},{20,90}})));
  ThermalPower.Experiments.SubComponents.Records.DHNSummary summary(
    dp_min=system_TPL.summary.dp_min,
    dp_plant=cogenerationPlant.summary.dp,
    m_flow_plant=cogenerationPlant.summary.m_flow_supply,
    T_supply_plant=cogenerationPlant.summary.T_supply,
    T_supply_subSystem6=subSystem6.T_supply_in_C + 273.15,
    T_supply_subSystem10=subSystem10.T_supply_in_C + 273.15,
    T_supply_subSystem14=subSystem14.T_supply_in_C + 273.15,
    m_flow_subSystem6=subSystem6.portA_supply.m_flow,
    m_flow_subSystem10=subSystem10.portA_supply.m_flow,
    m_flow_subSystem14=subSystem14.portA_supply.m_flow,
    Q_demand=Q_demand,
    Q_produced=cogenerationPlant.summary.heat + solarPlant.solarPlant.summary.heat)
    annotation (Placement(transformation(extent={{100,-88},{120,-68}})));
  ThermalPower.SubComponents.Deprecated.DistrictHeating.FlowResistances.DualFlowResistance friction(redeclare
      package Medium =                                                                                                         Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={30,-10})));
  Modelica.Blocks.Sources.CombiTimeTable groundTemperature(
    table=[0*24 + 0,-2; 0*24 + 12,3; 1*24 + 0,-3; 1*24 + 12,2; 2*24 + 0,-3; 2*
        24 + 12,-20; 2*24 + 14,-10; 3*24 + 0,-2; 3*24 + 12,3; 4*24 + 0,-2; 4*24
         + 12,3],
    smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint,
    timeScale(displayUnit="h") = 3600)
    annotation (Placement(transformation(extent={{62,70},{82,90}})));
equation
  connect(cogenerationPlant.dp_in, control.dp) annotation (Line(points={{-101,-16},{-106,-16},{-106,-10},{-109,-10}}, color={0,0,127}));
  connect(subSystem.portA_supply, cogenerationPlant.portSupply) annotation (Line(points={{-70,-16},{-80,-16}}, color={0,0,255}));
  connect(subSystem.portA_return, cogenerationPlant.portReturn) annotation (Line(points={{-70,-24},{-76,-24},{-76,-20},{-80,-20}}, color={0,0,255}));
  connect(subSystem5.portA_supply, subSystem2.portB_supply[1]) annotation (Line(points={{0,-78},{-6,-78},{-6,-46.25},{-10,-46.25}}, color={0,0,255}));
  connect(subSystem5.portA_return, subSystem2.portB_return[1]) annotation (Line(points={{0,-86},{-8,-86},{-8,-54.25},{-10,-54.25}}, color={0,0,255}));
  connect(subSystem4.portB_supply[1], subSystem6.portA_supply) annotation (Line(points={{20,-46.25},{60,-46.25},{60,-46}}, color={0,0,255}));
  connect(subSystem4.portB_return[1], subSystem6.portA_return) annotation (Line(points={{20,-54.25},{60,-54.25},{60,-54}}, color={0,0,255}));
  connect(subSystem7.portB_supply[1], subSystem8.portA_supply) annotation (Line(points={{-70,53.75},{-60,53.75},{-60,54}}, color={0,0,255}));
  connect(subSystem7.portB_return[1], subSystem8.portA_return) annotation (Line(points={{-70,45.75},{-60,45.75},{-60,46}}, color={0,0,255}));
  connect(subSystem9.portA_supply, subSystem7.portB_supply[2]) annotation (Line(points={{-60,84},{-66,84},{-66,54.25},{-70,54.25}}, color={0,0,255}));
  connect(subSystem9.portA_return, subSystem7.portB_return[2]) annotation (Line(points={{-60,76},{-64,76},{-64,46.25},{-70,46.25}}, color={0,0,255}));
  connect(subSystem8.portB_supply[1], subSystem10.portA_supply) annotation (Line(points={{-40,54},{-30,54}}, color={0,0,255}));
  connect(subSystem8.portB_return[1], subSystem10.portA_return) annotation (Line(points={{-40,46},{-30,46}}, color={0,0,255}));
  connect(subSystem12.portB_supply[1], subSystem13.portA_supply) annotation (Line(points={{80,54},{90,54}}, color={0,0,255}));
  connect(subSystem12.portB_return[1], subSystem13.portA_return) annotation (Line(points={{80,46},{90,46}}, color={0,0,255}));
  connect(subSystem13.portB_supply[1], subSystem14.portA_supply) annotation (Line(points={{110,54},{120,54}}, color={0,0,255}));
  connect(subSystem13.portB_return[1], subSystem14.portA_return) annotation (Line(points={{110,46},{120,46}}, color={0,0,255}));
  connect(subSystem11.portA_supply, subSystem10.portB_supply[1]) annotation (Line(points={{30,54},{30,53.75},{-10,53.75}}, color={0,0,255}));
  connect(step_T_supply.y, cogenerationPlant.T_in) annotation (Line(points={{-109,-40},{-106,-40},{-106,-20},{-101,-20}}, color={0,0,127}));
  connect(solarPlant.portSupply, subSystem10.portB_supply[2]) annotation (Line(points={{20,76},{24,76},{24,54.25},{-10,54.25}}, color={0,0,255}));
  connect(subSystem.portB_return[1], subSystem2.portA_return) annotation (Line(points={{-50,
          -24.3333},{-46,-24.3333},{-46,-54},{-30,-54}},                                                                                   color={0,0,255}));
  connect(subSystem1.portA_return, subSystem.portB_return[2]) annotation (Line(points={{-30,16},{-46,16},{-46,-24},{-50,-24}}, color={0,0,255}));
  connect(subSystem7.portA_return, subSystem.portB_return[3]) annotation (Line(points={{-90,46},
          {-100,46},{-100,16},{-48,16},{-48,-24},{-50,-24},{-50,-23.6667}},                                                                                       color={0,0,255}));
  connect(subSystem2.portA_supply, subSystem.portB_supply[1]) annotation (Line(points={{-30,-46},
          {-40,-46},{-40,-16.3333},{-50,-16.3333}},                                                                                        color={0,0,255}));
  connect(subSystem1.portA_supply, subSystem.portB_supply[2]) annotation (Line(points={{-30,24},{-38,24},{-38,-16},{-50,-16}}, color={0,0,255}));
  connect(subSystem7.portA_supply, subSystem.portB_supply[3]) annotation (Line(points={{-90,54},
          {-94,54},{-94,24},{-40,24},{-40,-15.6667},{-50,-15.6667}},                                                                                       color={0,0,255}));
  connect(subSystem11.portB_supply[1], subSystem12.portA_supply) annotation (Line(points={{50,54},{60,54}}, color={0,0,255}));
  connect(subSystem11.portB_return[1], subSystem12.portA_return) annotation (Line(points={{50,46},{60,46}}, color={0,0,255}));
  connect(subSystem4.portB_supply[2], friction.portB_supply) annotation (Line(points={{20,-45.75},{32,-45.75},{32,-20}}, color={0,0,255}));
  connect(subSystem4.portB_return[2], friction.portB_return) annotation (Line(points={{20,-53.75},{28,-53.75},{28,-20}}, color={0,0,255}));
  connect(friction.portA_return, subSystem1.portB_return[1]) annotation (Line(points={{28,0},{28,15.75},{-10,15.75}}, color={0,0,255}));
  connect(friction.portA_supply, subSystem1.portB_supply[1]) annotation (Line(points={{32,0},{32,23.75},{-10,23.75}}, color={0,0,255}));
  connect(subSystem11.portA_return, subSystem10.portB_return[1]) annotation (Line(points={{30,46},{30,45.75},{-10,45.75}}, color={0,0,255}));
  connect(solarPlant.portReturn, subSystem10.portB_return[2]) annotation (Line(points={{20,72},{22,72},{22,46.25},{-10,46.25}}, color={0,0,255}));
  connect(subSystem4.portA_supply, subSystem2.portB_supply[2]) annotation (Line(points={{0,-46},{-4,-46},{-4,-45.75},{-10,-45.75}}, color={0,0,255}));
  connect(subSystem4.portA_return, subSystem2.portB_return[2]) annotation (Line(points={{0,-54},{-4,-54},{-4,-53.75},{-10,-53.75}}, color={0,0,255}));
  connect(subSystem3.portA_supply, subSystem1.portB_supply[2]) annotation (Line(points={{60,24},{60,24.25},{-10,24.25}}, color={0,0,255}));
  connect(subSystem1.portB_return[2], subSystem3.portA_return) annotation (Line(points={{-10,16.25},{60,16.25},{60,16}}, color={0,0,255}));
  connect(groundTemperature.y[1], system_TPL.T_ambient_in)
    annotation (Line(points={{83,80},{109,80}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{140,100}})),
    experiment(
      StopTime=345600,
      Interval=21600,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"),
    __Dymola_experimentFlags(Evaluate=true),
    Documentation(info="<html>
<h4>Description</h4>
<p>District heating network model with 125 consumers arranged into 15 subsystems and two production units. The main production unit, <span style=\"font-family: Courier New;\">cogenerationPlant</span>, heats the supply water according to a predefined temperature profile and controls the pressure in the system, so that all consumers have a sufficient pressure difference.</p>
<h4>Scenario</h4>
<p>The simulated scenario runs over two days with table based consumer loads and varying ground temperature. After one day, the supply temperature is increased with 5 K, by monitoring the supply temperature in the rest of the system during the following time shows the delay time of the pipes. After 130 000 seconds, the <span style=\"font-family: Courier New;\">solarPlant</span> starts producing heat, which result in a reduction in the production from the main plant. This also results in reversing flow direction in pipes in <span style=\"font-family: Courier New;\">subSystem10</span>. </p>
<h4>Output</h4>
<p>Output variables of interest can be found in the <span style=\"font-family: Courier New;\">summary</span> record.</p>
<h4>Simulation setup</h4>
<p>Simulate for 172 800 seconds with a tolerance of 1e-5. Notice that parameter evaluation at start of simulation improves simulation performance significantly.</p>
</html>",
revisions="<html>
<hr><p><font color=\"#E72614\"><b>Copyright &copy; 2004-2023, MODELON AB</b></font> <font color=\"#AFAFAF\"><br /><br /> The use of this software component is regulated by the licensing conditions for Modelon Libraries. <br /> This copyright notice must, unaltered, accompany all components that are derived from, copied from, <br /> or by other means have their origin from any Modelon Library. </font></p>
</html>"));
end DistrictHeatingNetwork;
