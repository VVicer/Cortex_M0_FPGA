                PRESERVE8
                THUMB

                AREA    RESET, DATA, READONLY
                EXPORT  __Vectors

__Vectors       DCD     0x20000000                ; Top of Stack
                DCD     Reset_Handler             ; Reset Handler
                DCD     0                         ; NMI Handler
                DCD     0                         ; Hard Fault Handler
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; SVCall Handler
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; PendSV Handler
                DCD     0                         ; SysTick Handler
                DCD     0                         ; IRQ0 Handler

                AREA    |.text|, CODE, READONLY

; Reset Handler

Reset_Handler   PROC
                GLOBAL  Reset_Handler
                ENTRY
                LDR R2, =0x40000020               ;R2 GPIO OUT reg addr
                ADDS R3, R2, #4                   ;R3 GPIO IN reg addr
                ADDS R4, R3, #4                   ;R4 GPIO OUTen reg addr

GPIO LDR R6, =0x00 ;GPIO INPUT ENABLE VALUE
     STR R6, [R4] ;Set input ENABLE
     LDR R5, [R3] ;read GPIO value
	 
     LDR R6, =0x01 ;GPIO OUTPUT ENABLE VALUE
     STR R6, [R4] ;Set OUTPUT ENABLE
	 
     LDR R6, =0X01 ;GPIO_0 Set value
     STR R6, [R2] ;store
     MOVS R1, #1 ;Interval cnt initial
	 BL delay
     LDR R6, =0X03 ;GPIO_1 Set value
     STR R6, [R2] ;store
     MOVS R1, #1 ;Interval cnt initial
     BL delay

     B GPIO
	 
delay ADDS R1,R1,#1
      LDR R0,=0X600000
      CMP R0,R1
      BNE delay
      BX LR
;;;;;;;;;;;;;;;;;;;;;;

                ENDP
                    
                END
