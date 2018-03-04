;!!! Variable List used in the sequence file
; V101: count the # of stimuli that have been played. 
; V100: # of total stimulus trials (the Number of loops needed; Obtained from SampleSeqVar(100,tstims%); ) 
; V65: index of waveform areas, spike2 v7 only allows 10 playwave areas at maximum.
; V1: Flagger for Looping status (When V1=1, it signals a new loop starts; When V1=0, it signals a loop finishes). 
; V10: duration from recording onset ('A' is the trigger signal for starting recording)
; V11: duration from stimulus playing onset to recording offset;
        ; Configuration File has higher priority in determing the duration of recording. 
; V5:  duration from the end of previous loop to the start of next loop; 
        ; main script uses this period to check the status of Sequence file. 
; V4: Flagger for stopping the recording. 

            SET    0.01,3277,0
            VAR    V65,stimcode    ;Start from playing area 65 (Area A)
            VAR    V101,ntrials=0
            VAR    V22,tmp=0       ;use abs to align time
            VAR    V4,stopflag

L0:         ABS    tmp,tmp         ;Loopback point, one time step, 0.01 ms

            BEQ    stimcode,0,P0   ;If AREA = 2, play waveform area 2 instead of 1
            BEQ    stimcode,1,P1   ;If AREA = 2, play waveform area 2 instead of 1
            BEQ    stimcode,2,P2   ;If AREA = 2, play waveform area 2 instead of 1
            BEQ    stimcode,3,P3   ;If AREA = 2, play waveform area 2 instead of 1
            BEQ    stimcode,4,P4   ;If AREA = 2, play waveform area 2 instead of 1
            BEQ    stimcode,5,P5   ;If AREA = 2, play waveform area 2 instead of 1
            BEQ    stimcode,6,P6   ;If AREA = 2, play waveform area 2 instead of 1
            BEQ    stimcode,7,P7   ;If AREA = 2, play waveform area 2 instead of 1
            BEQ    stimcode,8,P8   ;If AREA = 2, play waveform area 2 instead of 1
            BEQ    stimcode,9,P9   ;If AREA = 2, play waveform area 2 instead of 1            BEQ    V65,0,P0   ;If AREA = 2, play waveform area 2 instead of 1
            BEQ    stimcode,10,PA  ;If AREA = 2, play waveform area 2 instead of 1
            BEQ    stimcode,11,PB  ;If AREA = 2, play waveform area 2 instead of 1
            BEQ    stimcode,12,PC  ;If AREA = 2, play waveform area 2 instead of 1
            BEQ    stimcode,13,PD  ;If AREA = 2, play waveform area 2 instead of 1            BEQ    V65,0,P0   ;If AREA = 2, play waveform area 2 instead of 1
            BEQ    stimcode,14,PE  ;If AREA = 2, play waveform area 2 instead of 1
            BEQ    stimcode,15,PF  ;If AREA = 2, play waveform area 2 instead of 1
            BEQ    stimcode,16,P10 ;If AREA = 2, play waveform area 2 instead of 1
            BEQ    stimcode,17,P11 ;If AREA = 2, play waveform area 2 instead of 1            BEQ    V65,0,P0   ;If AREA = 2, play waveform area 2 instead of 1
            BEQ    stimcode,18,P12 ;If AREA = 2, play waveform area 2 instead of 1
            BEQ    stimcode,19,P13 ;If AREA = 2, play waveform area 2 instead of 1
            BEQ    stimcode,20,P14 ;If AREA = 2, play waveform area 2 instead of 1
            BEQ    stimcode,21,P15 ;If AREA = 2, play waveform area 2 instead of 1
            BEQ    stimcode,22,P16 ;If AREA = 2, play waveform area 2 instead of 1            BEQ    V65,0,P0   ;If AREA = 2, play waveform area 2 instead of 1
            BEQ    stimcode,23,P17 ;If AREA = 2, play waveform area 2 instead of 1
            BEQ    stimcode,24,P18 ;If AREA = 2, play waveform area 2 instead of 1
            BEQ    stimcode,25,P19 ;If AREA = 2, play waveform area 2 instead of 1
            BEQ    stimcode,26,P1A ;If AREA = 2, play waveform area 2 instead of 1
            BEQ    stimcode,27,P1B ;If AREA = 2, play waveform area 2 instead of 1            BEQ    V65,0,P0   ;If AREA = 2, play waveform area 2 instead of 1
            BEQ    stimcode,28,P1C ;If AREA = 2, play waveform area 2 instead of 1
            BEQ    stimcode,29,P1D ;If AREA = 2, play waveform area 2 instead of 1
            BEQ    stimcode,30,P1E ;If AREA = 2, play waveform area 2 instead of 1
            BEQ    stimcode,31,P1F ;If AREA = 2, play waveform area 2 instead of 1




P0:         ADDI   ntrials,1
            ABS    tmp,tmp         ;no code is marked when fake_silence is played
            ;MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            ABS    tmp,tmp         ;;Added by Efe
            ABS    tmp,tmp         ;;Added by Efe
            ABS    tmp,tmp
            ;MARK   V65             ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            ABS    tmp,tmp         ;;Added by Efe
            ABS    tmp,tmp         ;;Added by Efe
            DELAY  s(2000e-006)    ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO 0,T             ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            ABS    tmp,tmp
            ;MARK   66              ;Generate digital marker at stim onset (66="B")
            ABS    tmp,tmp         ;;Added by Efe
            ABS    tmp,tmp         ;;Added by Efe
R0:         WAVEBR R0,W            ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(3000e-006)-22 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG


P1:         ADDI   ntrials,1
            MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            MARK   stimcode        ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            DELAY  s(2000e-006)    ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO 1,T             ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            MARK   66              ;Generate digital marker at stim onset (66="B")
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
R1:         WAVEBR R1,W            ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(3000e-006)-23 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG


P2:         ADDI   ntrials,1
            MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            MARK   stimcode        ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            DELAY  s(2000e-006)    ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO 2,T             ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            MARK   66              ;Generate digital marker at stim onset (66="B")
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
R2:         WAVEBR R2,W            ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(3000e-006)-24 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG


P3:         ADDI   ntrials,1
            MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            MARK   stimcode        ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            DELAY  s(2000e-006)    ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO 3,T             ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            MARK   66              ;Generate digital marker at stim onset (66="B")
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
R3:         WAVEBR R3,W            ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(3000e-006)-25 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG


P4:         ADDI   ntrials,1
            MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            MARK   stimcode        ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            DELAY  s(2000e-006)    ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO 4,T             ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            MARK   66              ;Generate digital marker at stim onset (66="B")
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
R4:         WAVEBR R4,W            ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(3000e-006)-26 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG


P5:         ADDI   ntrials,1
            ABS    tmp,tmp         ;no code is marked when fake_silence is played
            MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            ABS    tmp,tmp
            MARK   stimcode        ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            DELAY  s(2000e-006)    ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO 5,T             ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            ABS    tmp,tmp
            MARK   66              ;Generate digital marker at stim onset (66="B")
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
R5:         WAVEBR R5,W            ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(3000e-006)-27 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG


P6:         ADDI   ntrials,1
            ABS    tmp,tmp         ;no code is marked when fake_silence is played
            MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            ABS    tmp,tmp
            MARK   stimcode        ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            DELAY  s(2000e-006)    ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO 6,T             ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            ABS    tmp,tmp
            MARK   66              ;Generate digital marker at stim onset (66="B")
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
R6:         WAVEBR R6,W            ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(3000e-006)-28 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG

P7:         ADDI   ntrials,1
            ABS    tmp,tmp         ;no code is marked when fake_silence is played
            MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            ABS    tmp,tmp
            MARK   stimcode        ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            DELAY  s(2000e-006)    ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO 7,T             ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            ABS    tmp,tmp
            MARK   66              ;Generate digital marker at stim onset (66="B")
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
R7:         WAVEBR R7,W            ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(3000e-006)-29 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG


P8:         ADDI   ntrials,1
            ABS    tmp,tmp         ;no code is marked when fake_silence is played
            MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            ABS    tmp,tmp
            MARK   stimcode        ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            DELAY  s(2000e-006)    ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO 8,T             ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            ABS    tmp,tmp
            MARK   66              ;Generate digital marker at stim onset (66="B")
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
R8:         WAVEBR R8,W            ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(3000e-006)-30 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG


P9:         ADDI   ntrials,1
            ABS    tmp,tmp         ;no code is marked when fake_silence is played
            MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            ABS    tmp,tmp
            MARK   stimcode        ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            DELAY  s(2000e-006)    ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO 9,T             ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            ABS    tmp,tmp
            MARK   66              ;Generate digital marker at stim onset (66="B")
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
R9:         WAVEBR R9,W            ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(3000e-006)-31 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG

; The following PlayWave Areas are not supported in spike2 v7 but v9

PA:         ADDI   ntrials,1
            ABS    tmp,tmp         ;no code is marked when fake_silence is played
            ;MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            ABS    tmp,tmp
            ;MARK   V65             ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            DELAY  s(197e-005)     ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO A,T             ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            ABS    tmp,tmp
            ;MARK   66              ;Generate digital marker at stim onset (66="B")
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
RA:         WAVEBR RA,W            ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(5000e-005)-31 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG


PB:         ADDI   ntrials,1
            ABS    tmp,tmp         ;no code is marked when fake_silence is played
            ;MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            ABS    tmp,tmp
            ;MARK   V65             ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            DELAY  s(197e-005)     ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO B,T             ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            ABS    tmp,tmp
            ;MARK   66              ;Generate digital marker at stim onset (66="B")
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
RB:         WAVEBR RB,W            ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(5000e-005)-32 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG


PC:         ADDI   ntrials,1
            ABS    tmp,tmp         ;no code is marked when fake_silence is played
            ;MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            ABS    tmp,tmp
            ;MARK   V65             ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            DELAY  s(197e-005)     ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO C,T             ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            ABS    tmp,tmp
            ;MARK   66              ;Generate digital marker at stim onset (66="B")
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
RC:         WAVEBR RC,W            ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(5000e-005)-33 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG


PD:         ADDI   ntrials,1
            ABS    tmp,tmp         ;no code is marked when fake_silence is played
            ;MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            ABS    tmp,tmp
            ;MARK   V65             ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            DELAY  s(197e-005)     ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO D,T             ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            ABS    tmp,tmp
            ;MARK   66              ;Generate digital marker at stim onset (66="B")
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
RD:         WAVEBR RD,W            ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(5000e-005)-34 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG


PE:         ADDI   ntrials,1
            ABS    tmp,tmp         ;no code is marked when fake_silence is played
            ;MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            ABS    tmp,tmp
            ;MARK   V65             ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            DELAY  s(197e-005)     ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO E,T             ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            ABS    tmp,tmp
            ;MARK   66              ;Generate digital marker at stim onset (66="B")
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
RE:         WAVEBR RE,W            ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(5000e-005)-34 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG


PF:         ADDI   ntrials,1
            ABS    tmp,tmp         ;no code is marked when fake_silence is played
            ;MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            ABS    tmp,tmp
            ;MARK   V65             ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            DELAY  s(197e-005)     ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO F,T             ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            ABS    tmp,tmp
            ;MARK   66              ;Generate digital marker at stim onset (66="B")
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
RF:         WAVEBR RF,W            ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(5000e-005)-36 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG


P10:        ADDI   ntrials,1
            ABS    tmp,tmp         ;no code is marked when fake_silence is played
            ;MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            ABS    tmp,tmp
            ;MARK   V65             ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            DELAY  s(197e-005)     ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO 10,T            ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            ABS    tmp,tmp
            ;MARK   66              ;Generate digital marker at stim onset (66="B")
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
R10:        WAVEBR R10,W           ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(5000e-005)-37 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG


P11:        ADDI   ntrials,1
            ABS    tmp,tmp         ;no code is marked when fake_silence is played
            ;MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            ABS    tmp,tmp
            ;MARK   V65             ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            DELAY  s(197e-005)     ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO 11,T            ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            ABS    tmp,tmp
            ;MARK   66              ;Generate digital marker at stim onset (66="B")
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
R11:        WAVEBR R11,W           ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(5000e-005)-38 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG


P12:        ADDI   ntrials,1
            ABS    tmp,tmp         ;no code is marked when fake_silence is played
            ;MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            ABS    tmp,tmp
            ;MARK   V65             ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            DELAY  s(197e-005)     ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO 12,T            ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            ABS    tmp,tmp
            ;MARK   66              ;Generate digital marker at stim onset (66="B")
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
R12:        WAVEBR R12,W           ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(5000e-005)-39 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG


P13:        ADDI   ntrials,1
            ABS    tmp,tmp         ;no code is marked when fake_silence is played
            ;MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            ABS    tmp,tmp
            ;MARK   V65             ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            DELAY  s(197e-005)     ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO 13,T            ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            ABS    tmp,tmp
            ;MARK   66              ;Generate digital marker at stim onset (66="B")
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
R13:        WAVEBR R13,W           ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(5000e-005)-40 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG


P14:        ADDI   ntrials,1
            ABS    tmp,tmp         ;no code is marked when fake_silence is played
            ;MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            ABS    tmp,tmp
            ;MARK   V65             ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            DELAY  s(197e-005)     ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO 14,T            ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            ABS    tmp,tmp
            ;MARK   66              ;Generate digital marker at stim onset (66="B")
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
R14:        WAVEBR R14,W           ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(5000e-005)-41 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG


P15:        ADDI   ntrials,1
            ABS    tmp,tmp         ;no code is marked when fake_silence is played
            ;MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            ABS    tmp,tmp
            ;MARK   V65             ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            DELAY  s(197e-005)     ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO 15,T            ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            ABS    tmp,tmp
            ;MARK   66              ;Generate digital marker at stim onset (66="B")
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
R15:        WAVEBR R15,W           ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(5000e-005)-42 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG


P16:        ADDI   ntrials,1
            ABS    tmp,tmp         ;no code is marked when fake_silence is played
            ;MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            ABS    tmp,tmp
            ;MARK   V65             ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            DELAY  s(197e-005)     ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO 16,T            ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            ABS    tmp,tmp
            ;MARK   66              ;Generate digital marker at stim onset (66="B")
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
R16:        WAVEBR R16,W           ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(5000e-005)-43 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG


P17:        ADDI   ntrials,1
            ABS    tmp,tmp         ;no code is marked when fake_silence is played
            ;MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            ABS    tmp,tmp
            ;MARK   V65             ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            DELAY  s(197e-005)     ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO 17,T            ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            ABS    tmp,tmp
            ;MARK   66              ;Generate digital marker at stim onset (66="B")
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
R17:        WAVEBR R17,W           ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(5000e-005)-44 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG


P18:        ADDI   ntrials,1
            ABS    tmp,tmp         ;no code is marked when fake_silence is played
            ;MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            ABS    tmp,tmp
            ;MARK   V65             ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            DELAY  s(197e-005)     ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO 18,T            ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            ABS    tmp,tmp
            ;MARK   66              ;Generate digital marker at stim onset (66="B")
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
R18:        WAVEBR R18,W           ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(5000e-005)-45 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG

P19:        ADDI   ntrials,1
            ABS    tmp,tmp         ;no code is marked when fake_silence is played
            ;MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            ABS    tmp,tmp
            ;MARK   V65             ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            DELAY  s(197e-005)     ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO 19,T            ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            ABS    tmp,tmp
            ;MARK   66              ;Generate digital marker at stim onset (66="B")
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
R19:        WAVEBR R19,W           ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(5000e-005)-46 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG

P1A:        ADDI   ntrials,1
            ABS    tmp,tmp         ;no code is marked when fake_silence is played
            ;MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            ABS    tmp,tmp
            ;MARK   V65             ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            DELAY  s(197e-005)     ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO 1A,T            ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            ABS    tmp,tmp
            ;MARK   66              ;Generate digital marker at stim onset (66="B")
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
R1A:        WAVEBR R1A,W           ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(5000e-005)-47 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG


P1B:        ADDI   ntrials,1
            ABS    tmp,tmp         ;no code is marked when fake_silence is played
            ;MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            ABS    tmp,tmp
            ;MARK   V65             ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            DELAY  s(197e-005)     ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO 1B,T            ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            ABS    tmp,tmp
            ;MARK   66              ;Generate digital marker at stim onset (66="B")
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
R1B:        WAVEBR R1B,W           ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(5000e-005)-48 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG


P1C:        ADDI   ntrials,1
            ABS    tmp,tmp         ;no code is marked when fake_silence is played
            ;MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            ABS    tmp,tmp
            ;MARK   V65             ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            DELAY  s(197e-005)     ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO 1C,T            ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            ABS    tmp,tmp
            ;MARK   66              ;Generate digital marker at stim onset (66="B")
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
R1C:        WAVEBR R1C,W           ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(5000e-005)-49 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG


P1D:        ADDI   ntrials,1
            ABS    tmp,tmp         ;no code is marked when fake_silence is played
            ;MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            ABS    tmp,tmp
            ;MARK   V65             ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            DELAY  s(197e-005)     ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO 1D,T            ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            ABS    tmp,tmp
            ;MARK   66              ;Generate digital marker at stim onset (66="B")
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
R1D:        WAVEBR R1D,W           ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(5000e-005)-50 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG


P1E:        ADDI   ntrials,1
            ABS    tmp,tmp         ;no code is marked when fake_silence is played
            ;MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            ABS    tmp,tmp
            ;MARK   V65             ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            DELAY  s(197e-005)     ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO 1E,T            ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            ABS    tmp,tmp
            ;MARK   66              ;Generate digital marker at stim onset (66="B")
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
R1E:        WAVEBR R1E,W           ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(5000e-005)-51 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG


P1F:        ADDI   ntrials,1
            ABS    tmp,tmp         ;no code is marked when fake_silence is played
            ;MARK   65              ;Generate digital marker for trial start (hex41="A"=65)
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            ABS    tmp,tmp
            ;MARK   V65             ;mark stim number (V77 stores the stim number code, V77=SampleSeqVar(77,stimcode%))
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
            DELAY  s(197e-005)     ;change (.00994)-1 to s(97e-005) to space MARK-stim
                        ;   Play waveform in Area X
            WAVEGO 1F,T            ;Arm waveform
                        ;   Play waveform in Area X
            DELAY  V10             ;V10=isi%*100000*2.5/10 in script
            MOVI   V1,1            ;V1 := 1
            ABS    tmp,tmp
            ;MARK   66              ;Generate digital marker at stim onset (66="B")
            DIGOUT [00000000]      ;Added by Efe
            DIGOUT [00000100]      ;Added by Efe
R1F:        WAVEBR R1A,W           ;Ensure waveform ready
            WAVEST T               ;Trigger waveform
            DELAY  V11             ;V11=isi%*100000*5/10 in script
            WAVEST S               ;Stop waveform
            DAC    0,0             ;zero dac for next stim
            DELAY  s(5000e-005)-52 ;There are 22 time steps in the main loop normally; "JUMP TESTV4 is not executed usually"
            DELAY  V5              ;V5=isi%*100000*2/10-5200 in script
            MOVI   V1,0            ;V1 := 0
            JUMP   SFLAG



SFLAG:      BEQ    stopflag,1,NLOOP ;test V4 (stopflag), alright to continue
                                         ;V4 is only used when user stops the recording and want to start recording again
            JUMP   SFLAG           ;loop til V4 = 1
NLOOP:      DBNZ   V100,L0         ;Repeat required times
                                   ;V100: the Number of loops needed; Obtained from SampleSeqVar(100,tstims%); 


            HALT                   ;End of this sequence section
            HALT   
            HALT   
            HALT   
            DELAY  s(0.5)
            HALT   
            HALT   
            HALT