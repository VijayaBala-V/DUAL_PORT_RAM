# DUAL_PORT_RAM
🟦 Dual-Port RAM in System Verilog
<div align="center"> <h2>🟩 Dual-Port RAM in SystemVerilog</h2> <em>A versatile memory module with independent simultaneous read/write ports and parameterized configuration.</em> </div> <hr style="border:none; border-top:2px solid #4CAF50; margin-bottom:1.2em;"/> <div align="center" style="font-size:1.1em;">
🗂️ <b>Overview</b>
This project implements a <u>dual-port RAM</u> module in SystemVerilog — allowing concurrent access through two independent ports. Ideal for applications needing simultaneous read/write or dual-read/write operations in high-performance digital systems.

</div>
<div align="center">
✨ <b>Key Features</b>

</div> <ul> <li>🔹 <b>Two independent ports:</b> Port A and Port B simultaneously support read/write operations</li> <li>⚙️ <b>Parameterized design:</b> Easily customize data width, address width, and memory depth</li> <li>⏱️ <b>Synchronous operation:</b> All memory actions synchronized to clock inputs for reliable timing</li> <li>🔄 <b>Reset functionality:</b> Optional asynchronous or synchronous reset to clear memory if needed</li> <li>🧪 <b>Comprehensive testbench:</b> Validates dual-port operation under various scenarios</li> </ul> <div align="center">
<u><b>🔍 Design Details</b></u>

</div> <table align="center"> <tr><td><b>Inputs - Port A</b></td><td> <ul> <li>⏰ <b>clk_a</b>: Clock signal for Port A</li> <li>♻️ <b>rst_a</b>: Reset signal for Port A</li> <li>✅ <b>en_a</b>: Enable for Port A memory operations</li> <li>📝 <b>wr_rd_a</b>: Write/Read control for Port A (1: write, 0: read)</li> <li>🏷️ <b>addr_a</b>: Address input for Port A</li> <li>🔢 <b>data_in_a</b>: Data input for write on Port A</li> </ul> </td></tr> <tr><td><b>Outputs - Port A</b></td><td> <ul> <li>📤 <b>data_out_a</b>: Data output for read on Port A</li> <li>🟢 <b>out_en_a</b>: Output enable for Port A</li> </ul> </td></tr> <tr><td><b>Inputs - Port B</b></td><td> <ul> <li>⏰ <b>clk_b</b>: Clock signal for Port B</li> <li>♻️ <b>rst_b</b>: Reset signal for Port B</li> <li>✅ <b>en_b</b>: Enable for Port B memory operations</li> <li>📝 <b>wr_rd_b</b>: Write/Read control for Port B (1: write, 0: read)</li> <li>🏷️ <b>addr_b</b>: Address input for Port B</li> <li>🔢 <b>data_in_b</b>: Data input for write on Port B</li> </ul> </td></tr> <tr><td><b>Outputs - Port B</b></td><td> <ul> <li>📤 <b>data_out_b</b>: Data output for read on Port B</li> <li>🟢 <b>out_en_b</b>: Output enable for Port B</li> </ul> </td></tr> <tr><td><b>Parameters</b></td><td> <ul> <li><b>data_width</b>: Bit width of data stored</li> <li><b>addr_width</b>: Width of address bus</li> <li><b>depth</b>: Size of the memory (2<sup>addr_width</sup>)</li> </ul> </td></tr> </table> <div align="center">
🌟 <b>Testbench</b>
Includes scenarios for simultaneous reads/writes, address clashes, and timing validation for both ports.

</div> <div align="center">
<b>🚀 How to Use</b>

</div> <ol> <li>Clone this repository: <br><code>git clone https://github.com/your-repo/dual-port-ram.git</code></li> <li>Simulate your design & testbench with tools like ModelSim, VCS, or XSIM: <br><code>vcs design.sv testbench.sv; ./simv</code></li> <li>Configure parameters in the module definition to suit your system specifications.</li> </ol> <div align="center">
📄 <b>License</b>
This project is licensed under the MIT License. See LICENSE file for details.

</div> <hr style="border:none; border-top:2px dotted #4CAF50; margin-top:2em;"/> <div align="center" style="font-size:1.05em;"> Developed with care by <b>Vijaya Bala V</b> — Empowering parallel memory architectures for next-gen digital designs! </div>
