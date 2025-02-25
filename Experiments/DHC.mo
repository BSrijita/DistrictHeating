within DistrictHeating.Experiments;
model DHC

parameter Integer nBuildings = 3;
  Buildings.Controls.Continuous.LimPID conPID(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=0.1,
    Ti=120,
    Td=200,
    yMax=2,
    reverseActing=true)
    annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
  Modelica.Blocks.Sources.CombiTimeTable setPointAir(
    table=[0.0,273.15 + 20],
    smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)
    annotation (Placement(transformation(extent={{-150,-100},{-130,-80}})));
  Modelica.Blocks.Sources.Constant supWatTem(k=273.15 + 70)
    annotation (Placement(transformation(extent={{-126,-152},{-106,-132}})));
  Components.Building_Zone building_Zone
    annotation (Placement(transformation(extent={{-34,-12},{-8,14}})));
  Buildings.Fluid.HeatExchangers.Heater_T Boiler(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=0.0717,
    dp_nominal=0,
    QMax_flow(displayUnit="W"))         annotation (Placement(transformation(extent={{-40,
            -114},{-20,-94}})));
  Buildings.Fluid.Movers.Preconfigured.FlowControlled_m_flow
                                               pump(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    m_flow_nominal=0.0717,
    addPowerToMedium=false) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-2,-74})));
  Modelica.Blocks.Continuous.Integrator HeatEnergy(k=1/3600000)
    annotation (Placement(transformation(extent={{34,-110},{54,-90}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort senTem1(redeclare package Medium
      = Buildings.Media.Water, m_flow_nominal=0.0717)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-2,-38})));
  Buildings.Fluid.Sources.Boundary_pT bou(redeclare package Medium =
        Buildings.Media.Water, nPorts=1)
    annotation (Placement(transformation(extent={{-96,-44},{-76,-24}})));
equation
  connect(conPID.u_s,setPointAir. y[1]) annotation (
    Line(points={{-102,-90},{-129,-90}},    color = {0, 0, 127}));
  connect(Boiler.Q_flow,HeatEnergy. u) annotation (Line(points={{-19,-96},{22,
          -96},{22,-100},{32,-100}},                                                  color={0,0,127}));
  connect(senTem1.port_a,pump. port_b) annotation (Line(points={{-2,-48},{-2,
          -64}},                                                                      color={0,127,255}));
  connect(conPID.y, pump.m_flow_in) annotation (Line(points={{-79,-90},{-50,-90},
          {-50,-74},{-14,-74}}, color={0,0,127}));
  connect(building_Zone.y, conPID.u_m) annotation (Line(points={{-6.85294,8.7},
          {16,8.7},{16,-120},{-90,-120},{-90,-102}}, color={0,0,127}));
  connect(supWatTem.y, Boiler.TSet) annotation (Line(points={{-105,-142},{-86,
          -142},{-86,-110},{-50,-110},{-50,-96},{-42,-96}}, color={0,0,127}));
  connect(Boiler.port_a, building_Zone.port_b) annotation (Line(points={{-40,
          -104},{-52,-104},{-52,0.8},{-34.1529,0.8}}, color={0,127,255}));
  connect(Boiler.port_b, pump.port_a) annotation (Line(points={{-20,-104},{-10,
          -104},{-10,-90},{-2,-90},{-2,-84}}, color={0,127,255}));
  connect(building_Zone.port_a, senTem1.port_b) annotation (Line(points={{
          -7.69412,0.6},{0,0.6},{0,-22},{-2,-22},{-2,-28}}, color={0,127,255}));
  connect(bou.ports[1], building_Zone.port_b) annotation (Line(points={{-76,-34},
          {-66,-34},{-66,0.8},{-34.1529,0.8}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-160,
            -160},{200,100}})), Diagram(coordinateSystem(preserveAspectRatio=
            false, extent={{-160,-160},{200,100}})),
    experiment(StopTime=2678400, __Dymola_Algorithm="Dassl"));
end DHC;
