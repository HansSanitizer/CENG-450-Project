<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="rd_data1(15:0)" />
        <signal name="rd_data2(15:0)" />
        <signal name="result(15:0)" />
        <signal name="alu_mode(2:0)" />
        <signal name="wr_enable" />
        <signal name="rd_index1(2:0)" />
        <signal name="rd_index2(2:0)" />
        <signal name="wr_index(2:0)" />
        <signal name="clk" />
        <signal name="rst" />
        <port polarity="Input" name="alu_mode(2:0)" />
        <port polarity="Input" name="wr_enable" />
        <port polarity="Input" name="rd_index1(2:0)" />
        <port polarity="Input" name="rd_index2(2:0)" />
        <port polarity="Input" name="wr_index(2:0)" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="rst" />
        <blockdef name="alu_file">
            <timestamp>2017-2-10T0:31:14</timestamp>
            <rect width="288" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="416" y1="-288" y2="-288" x1="352" />
            <line x2="416" y1="-160" y2="-160" x1="352" />
            <rect width="64" x="352" y="-44" height="24" />
            <line x2="416" y1="-32" y2="-32" x1="352" />
        </blockdef>
        <blockdef name="register_file">
            <timestamp>2017-2-10T0:31:7</timestamp>
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
        <block symbolname="alu_file" name="XLXI_1">
            <blockpin name="clk" />
            <blockpin name="rst" />
            <blockpin signalname="rd_data1(15:0)" name="in1(15:0)" />
            <blockpin signalname="rd_data2(15:0)" name="in2(15:0)" />
            <blockpin signalname="alu_mode(2:0)" name="alu_mode(2:0)" />
            <blockpin name="z_flag" />
            <blockpin name="n_flag" />
            <blockpin signalname="result(15:0)" name="result(15:0)" />
        </block>
        <block symbolname="register_file" name="XLXI_2">
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="wr_enable" name="wr_enable" />
            <blockpin signalname="rd_index1(2:0)" name="rd_index1(2:0)" />
            <blockpin signalname="rd_index2(2:0)" name="rd_index2(2:0)" />
            <blockpin signalname="wr_index(2:0)" name="wr_index(2:0)" />
            <blockpin signalname="result(15:0)" name="wr_data(15:0)" />
            <blockpin signalname="rd_data1(15:0)" name="rd_data1(15:0)" />
            <blockpin signalname="rd_data2(15:0)" name="rd_data2(15:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="944" y="1536" name="XLXI_2" orien="R0">
        </instance>
        <instance x="1824" y="1456" name="XLXI_1" orien="R0">
        </instance>
        <branch name="rd_data1(15:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1536" y="1296" type="branch" />
            <wire x2="1440" y1="1120" y2="1120" x1="1392" />
            <wire x2="1440" y1="1120" y2="1296" x1="1440" />
            <wire x2="1536" y1="1296" y2="1296" x1="1440" />
            <wire x2="1824" y1="1296" y2="1296" x1="1536" />
        </branch>
        <branch name="rd_data2(15:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1536" y="1360" type="branch" />
            <wire x2="1440" y1="1504" y2="1504" x1="1392" />
            <wire x2="1440" y1="1360" y2="1504" x1="1440" />
            <wire x2="1516" y1="1360" y2="1360" x1="1440" />
            <wire x2="1536" y1="1360" y2="1360" x1="1516" />
            <wire x2="1824" y1="1360" y2="1360" x1="1536" />
        </branch>
        <branch name="result(15:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2080" y="1680" type="branch" />
            <wire x2="944" y1="1504" y2="1504" x1="896" />
            <wire x2="896" y1="1504" y2="1680" x1="896" />
            <wire x2="2080" y1="1680" y2="1680" x1="896" />
            <wire x2="2288" y1="1680" y2="1680" x1="2080" />
            <wire x2="2288" y1="1424" y2="1424" x1="2240" />
            <wire x2="2288" y1="1424" y2="1680" x1="2288" />
        </branch>
        <branch name="alu_mode(2:0)">
            <wire x2="1824" y1="1424" y2="1424" x1="1792" />
        </branch>
        <iomarker fontsize="28" x="1792" y="1424" name="alu_mode(2:0)" orien="R180" />
        <branch name="wr_enable">
            <wire x2="944" y1="1248" y2="1248" x1="912" />
        </branch>
        <iomarker fontsize="28" x="912" y="1248" name="wr_enable" orien="R180" />
        <branch name="rd_index1(2:0)">
            <wire x2="944" y1="1312" y2="1312" x1="912" />
        </branch>
        <iomarker fontsize="28" x="912" y="1312" name="rd_index1(2:0)" orien="R180" />
        <branch name="rd_index2(2:0)">
            <wire x2="944" y1="1376" y2="1376" x1="912" />
        </branch>
        <iomarker fontsize="28" x="912" y="1376" name="rd_index2(2:0)" orien="R180" />
        <branch name="wr_index(2:0)">
            <wire x2="944" y1="1440" y2="1440" x1="912" />
        </branch>
        <iomarker fontsize="28" x="912" y="1440" name="wr_index(2:0)" orien="R180" />
        <branch name="clk">
            <wire x2="944" y1="1184" y2="1184" x1="912" />
        </branch>
        <iomarker fontsize="28" x="912" y="1184" name="clk" orien="R180" />
        <branch name="rst">
            <wire x2="944" y1="1120" y2="1120" x1="912" />
        </branch>
        <iomarker fontsize="28" x="912" y="1120" name="rst" orien="R180" />
    </sheet>
</drawing>