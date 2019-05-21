// Bootleg jQuery selector from: https://developer.mozilla.org/en-US/docs/Archive/Add-ons/Code_snippets/QuerySelector
function $ (selector, el) {
    if (!el) {el = document;}
    return el.querySelector(selector);
}

a = 0   // Accumulator A
c = 0   // Carry Flag
z = 0   // Zero Flag

stack = []

pc = 0  // Program Counter

ram = [0,0] // Mini Fake RAM 

// Code (Bootleg SNESASM I call it)
code = [
    {"LSR_dp": 1},
    {"BEQ": 7},
    {"BCC": 5},
    {"CLC": 0},
    {"ADC_dp": 0},
    {"ASL_dp": 0}, // 5
    {"BRA": 0},
    {"CLC": 0},
    {"ADC_dp": 0},
    {"RTS": 0}
]

fixed_code = [
    {"PHA": 0},
    {"LDA_dp": 0},
    {"BEQ": 20},
    {"LDA_dp": 1},
    {"BEQ": 20},
    {"PLA": 0},    // 5
    {"LSR_dp": 1},
    {"BEQ": 14},
    {"BCC": 11},
    {"CLC": 0},
    {"ADC_dp": 0}, // 10
    {"BVS": 18},
    {"ASL_dp": 0},
    {"BRA": 6},
    {"CLC": 0},
    {"ADC_dp": 0}, // 15
    {"BVS": 18}, 
    {"RTS": 0}, 
    {"LDA_v": 0xFFFF},
    {"RTS": 0},
    {"PLA": 0}, // 20
    {"RTS": 0}
]

// Trace log
trace = []

function calculate() {
    a = parseInt($("#a").value)
    ram[0] = parseInt($("#ram00").value)
    ram[1] = parseInt($("#ram01").value)
    c = 0
    o = 0
    z = 0

    pc = 0

    stack = []

    anti_stuck = 1024

    trace = [{
        "pc": "INIT", "a": a, "c": c, "o": o, "z": z, "opcode": "---", "opcode_value": "---", "ram": ram.toString()
    }]

    if ($("#apply_fix").checked) {
        use_code = fixed_code
    } else {
        use_code = code
    }

    while (pc < use_code.length && anti_stuck > 0) {
        code_row = use_code[pc]
        opcode = Object().constructor.keys(code_row)[0]
        value = code_row[opcode]
        pc_before = pc
        
        eval(opcode + "(" + value + ")")

        trace.push({
            "pc": pc_before, "a": a, "c": c, "o": o, "z": z, "opcode": opcode, "opcode_value": value, "ram": ram.toString()
        })

        pc++
        anti_stuck--
    }

    trace2table()

    $("#result").value = a & 0xFFFF
}

function ADC_dp(addr) {
    a += ram[addr]
    
    if (a > 0xFFFF) {
        a = a & 0xFFFF
        o = 1
    } else {
        o = 0
    }

    if (a == 0) {
        z = 1
    } else {
        z = 0
    }
}

function ASL_dp(addr) {
    new_value = ram[addr] << 1
    if (new_value > 0xFFFF) {
        new_value = new_value & 0xFFFF
        c = 1
    } else {
        c = 0
    }
    
    ram[addr] = new_value
}

function BCC(pc_offset) {
    if (c == 0) {
        pc = pc_offset - 1
    }
}

function BEQ(pc_offset) {
    if (z == 1) {
        pc = pc_offset - 1
    }
}

function BRA(pc_offset) {
    pc = pc_offset - 1
}

function BVS(pc_offset) {
    if (o == 1) {
        pc = pc_offset - 1
    }
}

function CLC() {
    c = 0
}

function LDA_dp(addr) {
    a = ram[addr]
    
    if (a == 0) {
        z = 1
    } else {
        z = 0
    }
}

function LDA_v(value) {
    a = value
    
    if (a == 0) {
        z = 1
    } else {
        z = 0
    }
}

function LSR_dp(addr) {
    address_value = ram[addr]
    
    c = address_value & 0x0001 

    new_value = address_value >> 1

    if (new_value == 0) {
        z = 1
    } else {
        z = 0
    }
    
    ram[addr] = new_value
}

function PHA() {
    stack.push(a)
}

function PLA() {
    a = stack.pop()

    if (a == 0) {
        z = 1
    } else {
        z = 0
    }
}

function RTS() {
    pc = 9001
}

function trace2table() {
    tbl = $("#tracelog_body")
    tbl.innerHTML = ""

    for (var i = 0; i < trace.length; i ++) {

        row =  ""
        row += "<tr>"
        row += "<td>" + trace[i].pc + "</td>"
        row += "<td>" + trace[i].opcode + "</td>"
        row += "<td>" + trace[i].opcode_value + "</td>"
        row += "<td>" + trace[i].a + "</td>"
        row += "<td>" + trace[i].c + "</td>"
        row += "<td>" + trace[i].o + "</td>"
        row += "<td>" + trace[i].z + "</td>"
        row += "<td>" + trace[i].ram + "</td>"
        row += "</tr>"

        tbl.innerHTML += row

    }

    $("#steps").innerHTML = trace.length
}

calculate()
