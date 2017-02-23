<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1(2:0)" />
        <signal name="XLXN_2(2:0)" />
        <signal name="DATA_1(15:0)" />
        <signal name="DATA_2(15:0)" />
        <signal name="wr_index(2:0)" />
        <signal name="wr_data(15:0)" />
        <signal name="wr_enable" />
        <signal name="XLXN_12" />
        <signal name="CLK" />
        <signal name="RST" />
        <signal name="INPUT(15:0)" />
        <signal name="ALU_CODE(2:0)" />
        <port polarity="Output" name="DATA_1(15:0)" />
        <port polarity="Output" name="DATA_2(15:0)" />
        <port polarity="Input" name="wr_index(2:0)" />
        <port polarity="Input" name="wr_data(15:0)" />
        <port polarity="Input" name="wr_enable" />
        <port polarity="Input" name="CLK" />
        <port polarity="Input" name="RST" />
        <port polarity="Input" name="INPUT(15:0)" />
        <port polarity="Output" name="ALU_CODE(2:0)" />
        <blockdef name="decoder">
            <timestamp>2017-2-9T23:23:6</timestamp>
            <rect width="336" x="64" y="-256" height="256" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="400" y="-236" height="24" />
            <line x2="464" y1="-224" y2="-224" x1="400" />
            <rect width="64" x="400" y="-172" height="24" />
            <line x2="464" y1="-160" y2="-160" x1="400" />
            <rect width="64" x="400" y="-108" height="24" />
            <line x2="464" y1="-96" y2="-96" x1="400" />
            <rect width="64" x="400" y="-44" height="24" />
            <line x2="464" y1="-32" y2="-32" x1="400" />
        </blockdef>
        <blockdef name="register_file">
            <timestamp>2017-2-9T23:22:59</timestamp>
            <rect width="320" x="64" y="-448" height="448" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="384" y="-428" height="24" />
            <line x2="448" y1="-416" y2="-416" x1="384" />
            <rect width="64" x="384" y="-44" height="24" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
        </blockdef>
        <block symbolname="register_file" name="XLXI_2">
            <blockpin signalname="RST" name="rst" />
            <blockpin signalname="CLK" name="clk" />
            <blockpin signalname="wr_enable" name="wr_enable" />
            <blockpin signalname="XLXN_1(2:0)" name="rd_index1(2:0)" />
            <blockpin signalname="XLXN_2(2:0)" name="rd_index2(2:0)" />
            <blockpin signalname="wr_index(2:0)" name="wr_index(2:0)" />
            <blockpin signalname="wr_data(15:0)" name="wr_data(15:0)" />
            <blockpin signalname="DATA_1(15:0)" name="rd_data1(15:0)" />
            <blockpin signalname="DATA_2(15:0)" name="rd_data2(15:0)" />
        </block>
        <block symbolname="decoder" name="XLXI_1">
            <blockpin signalname="INPUT(15:0)" name="instruction(15:0)" />
            <blockpin signalname="ALU_CODE(2:0)" name="alu_code(2:0)" />
            <blockpin name="ra_addr(2:0)" />
            <blockpin signalname="XLXN_1(2:0)" name="rb_addr(2:0)" />
            <blockpin signalname="XLXN_2(2:0)" name="rc_addr(2:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="XLXN_1(2:0)">
            <wire x2="1552" y1="1440" y2="1440" x1="1168" />
            <wire x2="1568" y1="1440" y2="1440" x1="1552" />
        </branch>
        <branch name="XLXN_2(2:0)">
            <wire x2="1552" y1="1504" y2="1504" x1="1168" />
            <wire x2="1568" y1="1504" y2="1504" x1="1552" />
        </branch>
        <instance x="1568" y="1664" name="XLXI_2" orien="R0">
        </instance>
        <branch name="DATA_1(15:0)">
            <wire x2="2048" y1="1248" y2="1248" x1="2016" />
        </branch>
        <iomarker fontsize="28" x="2048" y="1248" name="DATA_1(15:0)" orien="R0" />
        <branch name="DATA_2(15:0)">
            <wire x2="2048" y1="1632" y2="1632" x1="2016" />
        </branch>
        <iomarker fontsize="28" x="2048" y="1632" name="DATA_2(15:0)" orien="R0" />
        <branch name="wr_index(2:0)">
            <wire x2="1568" y1="1568" y2="1568" x1="1536" />
        </branch>
        <iomarker fontsize="28" x="1536" y="1568" name="wr_index(2:0)" orien="R180" />
        <branch name="wr_data(15:0)">
            <wire x2="1568" y1="1632" y2="1632" x1="1536" />
        </branch>
        <iomarker fontsize="28" x="1536" y="1632" name="wr_data(15:0)" orien="R180" />
        <branch name="wr_enable">
            <wire x2="1568" y1="1376" y2="1376" x1="1536" />
        </branch>
        <iomarker fontsize="28" x="1536" y="1376" name="wr_enable" orien="R180" />
        <branch name="CLK">
            <wire x2="1568" y1="1312" y2="1312" x1="1536" />
        </branch>
        <iomarker fontsize="28" x="1536" y="1312" name="CLK" orien="R180" />
        <branch name="RST">
            <wire x2="1568" y1="1248" y2="1248" x1="1536" />
        </branch>
        <iomarker fontsize="28" x="1536" y="1248" name="RST" orien="R180" />
        <instance x="704" y="1536" name="XLXI_1" orien="R0">
        </instance>
        <branch name="INPUT(15:0)">
            <wire x2="688" y1="1312" y2="1312" x1="672" />
            <wire x2="704" y1="1312" y2="1312" x1="688" />
        </branch>
        <iomarker fontsize="28" x="672" y="1312" name="INPUT(15:0)" orien="R180" />
        <branch name="ALU_CODE(2:0)">
            <wire x2="1248" y1="1312" y2="1312" x1="1168" />
            <wire x2="1248" y1="1088" y2="1312" x1="1248" />
            <wire x2="1328" y1="1088" y2="1088" x1="1248" />
        </branch>
        <iomarker fontsize="28" x="1328" y="1088" name="ALU_CODE(2:0)" orien="R0" />
    </sheet>
</drawing>