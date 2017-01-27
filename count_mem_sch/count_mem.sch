<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CE" />
        <signal name="CLK" />
        <signal name="RST" />
        <signal name="XLXN_4" />
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <signal name="OUT_MEM(7:0)" />
        <signal name="XLXN_8(7:0)" />
        <signal name="XLXN_9(7:0)" />
        <port polarity="Input" name="CE" />
        <port polarity="Input" name="CLK" />
        <port polarity="Input" name="RST" />
        <port polarity="Output" name="OUT_MEM(7:0)" />
        <blockdef name="cb8re">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <rect width="64" x="320" y="-268" height="24" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <rect width="256" x="64" y="-320" height="256" />
        </blockdef>
        <blockdef name="ibufg">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
        </blockdef>
        <blockdef name="ibuf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
        </blockdef>
        <blockdef name="Memory">
            <timestamp>2017-1-27T0:33:18</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="obuf8">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <rect width="64" x="0" y="-44" height="24" />
            <rect width="96" x="128" y="-44" height="24" />
        </blockdef>
        <block symbolname="cb8re" name="XLXI_1">
            <blockpin signalname="XLXN_5" name="C" />
            <blockpin signalname="XLXN_4" name="CE" />
            <blockpin signalname="XLXN_6" name="R" />
            <blockpin name="CEO" />
            <blockpin signalname="XLXN_8(7:0)" name="Q(7:0)" />
            <blockpin name="TC" />
        </block>
        <block symbolname="ibufg" name="XLXI_2">
            <blockpin signalname="CLK" name="I" />
            <blockpin signalname="XLXN_5" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_3">
            <blockpin signalname="CE" name="I" />
            <blockpin signalname="XLXN_4" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_4">
            <blockpin signalname="RST" name="I" />
            <blockpin signalname="XLXN_6" name="O" />
        </block>
        <block symbolname="Memory" name="XLXI_6">
            <blockpin signalname="XLXN_8(7:0)" name="addr(7:0)" />
            <blockpin signalname="XLXN_9(7:0)" name="dout(7:0)" />
        </block>
        <block symbolname="obuf8" name="XLXI_7">
            <blockpin signalname="XLXN_9(7:0)" name="I(7:0)" />
            <blockpin signalname="OUT_MEM(7:0)" name="O(7:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1456" y="1280" name="XLXI_1" orien="R0" />
        <instance x="1152" y="1184" name="XLXI_2" orien="R0" />
        <instance x="1152" y="1104" name="XLXI_3" orien="R0" />
        <instance x="1152" y="1280" name="XLXI_4" orien="R0" />
        <branch name="CE">
            <wire x2="1152" y1="1072" y2="1072" x1="1120" />
        </branch>
        <iomarker fontsize="28" x="1120" y="1072" name="CE" orien="R180" />
        <branch name="CLK">
            <wire x2="1152" y1="1152" y2="1152" x1="1120" />
        </branch>
        <iomarker fontsize="28" x="1120" y="1152" name="CLK" orien="R180" />
        <branch name="RST">
            <wire x2="1152" y1="1248" y2="1248" x1="1120" />
        </branch>
        <iomarker fontsize="28" x="1120" y="1248" name="RST" orien="R180" />
        <branch name="XLXN_4">
            <wire x2="1408" y1="1072" y2="1072" x1="1376" />
            <wire x2="1408" y1="1072" y2="1088" x1="1408" />
            <wire x2="1456" y1="1088" y2="1088" x1="1408" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="1456" y1="1152" y2="1152" x1="1376" />
        </branch>
        <branch name="XLXN_6">
            <wire x2="1456" y1="1248" y2="1248" x1="1376" />
        </branch>
        <instance x="1920" y="1056" name="XLXI_6" orien="R0">
        </instance>
        <instance x="2080" y="1216" name="XLXI_7" orien="R0" />
        <branch name="OUT_MEM(7:0)">
            <wire x2="2336" y1="1184" y2="1184" x1="2304" />
        </branch>
        <iomarker fontsize="28" x="2336" y="1184" name="OUT_MEM(7:0)" orien="R0" />
        <branch name="XLXN_8(7:0)">
            <wire x2="1920" y1="1024" y2="1024" x1="1840" />
        </branch>
        <branch name="XLXN_9(7:0)">
            <wire x2="2016" y1="1072" y2="1184" x1="2016" />
            <wire x2="2080" y1="1184" y2="1184" x1="2016" />
            <wire x2="2384" y1="1072" y2="1072" x1="2016" />
            <wire x2="2384" y1="1024" y2="1024" x1="2304" />
            <wire x2="2384" y1="1024" y2="1072" x1="2384" />
        </branch>
    </sheet>
</drawing>