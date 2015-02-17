; ModuleID = 'trisolv.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !33, metadata !75), !dbg !76
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !34, metadata !75), !dbg !77
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !35, metadata !75), !dbg !78
  %call = tail call i8* @polybench_alloc_data(i32 16000000, i32 8) #4, !dbg !79
  %call1 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !80
  %call2 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !81
  %arraydecay = bitcast i8* %call to [4000 x double]*, !dbg !82
  %arraydecay3 = bitcast i8* %call1 to double*, !dbg !83
  %arraydecay4 = bitcast i8* %call2 to double*, !dbg !84
  tail call fastcc void @init_array([4000 x double]* %arraydecay, double* %arraydecay3, double* %arraydecay4), !dbg !85
  tail call fastcc void @kernel_trisolv([4000 x double]* %arraydecay, double* %arraydecay3, double* %arraydecay4), !dbg !86
  %cmp = icmp sgt i32 %argc, 42, !dbg !87
  br i1 %cmp, label %if.end44, label %if.end51, !dbg !88

if.end44:                                         ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !42, metadata !75), !dbg !89
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !43, metadata !75), !dbg !90
  %0 = load i8** %argv, align 8, !dbg !91, !tbaa !93
  %1 = load i8* %0, align 1, !dbg !91, !tbaa !97
  %phitmp = icmp eq i8 %1, 0, !dbg !89
  br i1 %phitmp, label %if.then49, label %if.end51, !dbg !88

if.then49:                                        ; preds = %if.end44
  tail call fastcc void @print_array(double* %arraydecay3), !dbg !98
  br label %if.end51, !dbg !98

if.end51:                                         ; preds = %if.end44, %if.then49, %entry
  tail call void @free(i8* %call) #4, !dbg !100
  tail call void @free(i8* %call1) #4, !dbg !101
  tail call void @free(i8* %call2) #4, !dbg !102
  ret i32 0, !dbg !103
}

declare i8* @polybench_alloc_data(i32, i32) #1

; Function Attrs: nounwind uwtable
define internal fastcc void @init_array([4000 x double]* nocapture %A, double* nocapture %x, double* nocapture %c) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !66, metadata !75), !dbg !104
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !70, metadata !75), !dbg !105
  br label %for.body, !dbg !106

for.body:                                         ; preds = %for.inc16, %entry
  %indvars.iv3 = phi i64 [ 0, %entry ], [ %indvars.iv.next4, %for.inc16 ]
  %0 = trunc i64 %indvars.iv3 to i32, !dbg !108
  %conv = sitofp i32 %0 to double, !dbg !108
  %div = fdiv double %conv, 4.000000e+03, !dbg !111
  %arrayidx = getelementptr inbounds double* %x, i64 %indvars.iv3, !dbg !112
  store double %div, double* %arrayidx, align 8, !dbg !112, !tbaa !113
  %arrayidx3 = getelementptr inbounds double* %c, i64 %indvars.iv3, !dbg !115
  store double %div, double* %arrayidx3, align 8, !dbg !115, !tbaa !113
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !71, metadata !75), !dbg !116
  br label %for.body7, !dbg !117

for.body7:                                        ; preds = %for.body7, %for.body
  %indvars.iv = phi i64 [ 0, %for.body ], [ %indvars.iv.next, %for.body7 ]
  %1 = trunc i64 %indvars.iv to i32, !dbg !119
  %conv9 = sitofp i32 %1 to double, !dbg !119
  %mul = fmul double %conv, %conv9, !dbg !121
  %div11 = fdiv double %mul, 4.000000e+03, !dbg !122
  %arrayidx15 = getelementptr inbounds [4000 x double]* %A, i64 %indvars.iv3, i64 %indvars.iv, !dbg !123
  store double %div11, double* %arrayidx15, align 8, !dbg !123, !tbaa !113
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !117
  %exitcond = icmp eq i64 %indvars.iv.next, 4000, !dbg !117
  br i1 %exitcond, label %for.inc16, label %for.body7, !dbg !117

for.inc16:                                        ; preds = %for.body7
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !106
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 4000, !dbg !106
  br i1 %exitcond5, label %for.end18, label %for.body, !dbg !106

for.end18:                                        ; preds = %for.inc16
  ret void, !dbg !124
}

; Function Attrs: nounwind uwtable
define internal fastcc void @kernel_trisolv([4000 x double]* nocapture readonly %A, double* nocapture %x, double* nocapture readonly %c) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !58, metadata !75), !dbg !125
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !62, metadata !75), !dbg !126
  br label %for.body, !dbg !127

for.body:                                         ; preds = %for.end, %entry
  %indvars.iv4 = phi i64 [ 0, %entry ], [ %indvars.iv.next5, %for.end ]
  %arrayidx = getelementptr inbounds double* %c, i64 %indvars.iv4, !dbg !129
  %0 = load double* %arrayidx, align 8, !dbg !129, !tbaa !113
  %arrayidx2 = getelementptr inbounds double* %x, i64 %indvars.iv4, !dbg !132
  store double %0, double* %arrayidx2, align 8, !dbg !132, !tbaa !113
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !63, metadata !75), !dbg !133
  %1 = add nsw i64 %indvars.iv4, -1, !dbg !134
  %cmp41 = icmp slt i64 %indvars.iv4, 1, !dbg !137
  br i1 %cmp41, label %for.end, label %for.body5, !dbg !138

for.body5:                                        ; preds = %for.body, %for.body5
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body5 ], [ 0, %for.body ]
  %2 = phi double [ %sub14, %for.body5 ], [ %0, %for.body ]
  %arrayidx11 = getelementptr inbounds [4000 x double]* %A, i64 %indvars.iv4, i64 %indvars.iv, !dbg !139
  %3 = load double* %arrayidx11, align 8, !dbg !139, !tbaa !113
  %arrayidx13 = getelementptr inbounds double* %x, i64 %indvars.iv, !dbg !140
  %4 = load double* %arrayidx13, align 8, !dbg !140, !tbaa !113
  %mul = fmul double %3, %4, !dbg !139
  %sub14 = fsub double %2, %mul, !dbg !141
  store double %sub14, double* %arrayidx2, align 8, !dbg !142, !tbaa !113
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !138
  %cmp4 = icmp slt i64 %indvars.iv, %1, !dbg !137
  br i1 %cmp4, label %for.body5, label %for.end, !dbg !138

for.end:                                          ; preds = %for.body5, %for.body
  %.lcssa = phi double [ %0, %for.body ], [ %sub14, %for.body5 ]
  %arrayidx22 = getelementptr inbounds [4000 x double]* %A, i64 %indvars.iv4, i64 %indvars.iv4, !dbg !143
  %5 = load double* %arrayidx22, align 8, !dbg !143, !tbaa !113
  %div = fdiv double %.lcssa, %5, !dbg !144
  store double %div, double* %arrayidx2, align 8, !dbg !145, !tbaa !113
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1, !dbg !127
  %exitcond = icmp eq i64 %indvars.iv.next5, 4000, !dbg !127
  br i1 %exitcond, label %for.end27, label %for.body, !dbg !127

for.end27:                                        ; preds = %for.end
  ret void, !dbg !146
}

; Function Attrs: nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %x) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !51, metadata !75), !dbg !147
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !53, metadata !75), !dbg !148
  br label %for.body, !dbg !149

for.body:                                         ; preds = %for.inc, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc ]
  %0 = load %struct._IO_FILE** @stderr, align 8, !dbg !151, !tbaa !93
  %arrayidx = getelementptr inbounds double* %x, i64 %indvars.iv, !dbg !154
  %1 = load double* %arrayidx, align 8, !dbg !154, !tbaa !113
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %1) #5, !dbg !155
  %2 = trunc i64 %indvars.iv to i32, !dbg !156
  %rem = srem i32 %2, 20, !dbg !156
  %cmp1 = icmp eq i32 %rem, 0, !dbg !156
  br i1 %cmp1, label %if.then, label %for.inc, !dbg !158

if.then:                                          ; preds = %for.body
  %3 = load %struct._IO_FILE** @stderr, align 8, !dbg !159, !tbaa !93
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %3) #6, !dbg !161
  br label %for.inc, !dbg !161

for.inc:                                          ; preds = %for.body, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !149
  %exitcond = icmp eq i64 %indvars.iv.next, 4000, !dbg !149
  br i1 %exitcond, label %for.end, label %for.body, !dbg !149

for.end:                                          ; preds = %for.inc
  ret void, !dbg !162
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { cold nounwind }
attributes #6 = { cold }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!72, !73}
!llvm.ident = !{!74}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !24, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c] [DW_LANG_C99]
!1 = !{!"trisolv.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv"}
!2 = !{}
!3 = !{!4, !9, !12, !15, !17, !20, !23, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\001024000000\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1024000000, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\004000"}                        ; [ DW_TAG_subrange_type ] [0, 3999]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!"0x1\00\000\00256000\0064\000\000\000", null, null, !6, !11, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256000, align 64, offset 0] [from double]
!11 = !{!8}
!12 = !{!"0x16\00size_t\0062\000\000\000\000", !13, null, !14} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!13 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv"}
!14 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!15 = !{!"0xf\00\000\0064\0064\000\000", null, null, !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!16 = !{!"0x26\00\000\000\000\000\000", null, null, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = !{!"0xf\00\000\0064\0064\000\000", null, null, !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!18 = !{!"0x26\00\000\000\000\000\000", null, null, !19} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from unsigned char]
!19 = !{!"0x24\00unsigned char\000\008\008\000\000\008", null, null} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!20 = !{!"0xf\00\000\0064\0064\000\000", null, null, !21} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!21 = !{!"0x26\00\000\000\000\000\000", null, null, !22} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!22 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!23 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!24 = !{!25, !46, !54, !64}
!25 = !{!"0x2e\00main\00main\00\0078\000\001\000\000\00256\001\0079", !1, !26, !27, null, i32 (i32, i8**)* @main, null, null, !32} ; [ DW_TAG_subprogram ] [line 78] [def] [scope 79] [main]
!26 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!29, !29, !30}
!29 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!30 = !{!"0xf\00\000\0064\0064\000\000", null, null, !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!32 = !{!33, !34, !35, !36, !37, !38, !39, !42, !43, !45}
!33 = !{!"0x101\00argc\0016777294\000", !25, !26, !29} ; [ DW_TAG_arg_variable ] [argc] [line 78]
!34 = !{!"0x101\00argv\0033554510\000", !25, !26, !30} ; [ DW_TAG_arg_variable ] [argv] [line 78]
!35 = !{!"0x100\00n\0081\000", !25, !26, !29}     ; [ DW_TAG_auto_variable ] [n] [line 81]
!36 = !{!"0x100\00A\0084\000", !25, !26, !4}      ; [ DW_TAG_auto_variable ] [A] [line 84]
!37 = !{!"0x100\00x\0085\000", !25, !26, !9}      ; [ DW_TAG_auto_variable ] [x] [line 85]
!38 = !{!"0x100\00c\0086\000", !25, !26, !9}      ; [ DW_TAG_auto_variable ] [c] [line 86]
!39 = !{!"0x100\00__s1_len\00104\000", !40, !26, !12} ; [ DW_TAG_auto_variable ] [__s1_len] [line 104]
!40 = !{!"0xb\00104\003\001", !1, !41}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!41 = !{!"0xb\00104\003\000", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!42 = !{!"0x100\00__s2_len\00104\000", !40, !26, !12} ; [ DW_TAG_auto_variable ] [__s2_len] [line 104]
!43 = !{!"0x100\00__s2\00104\000", !44, !26, !17} ; [ DW_TAG_auto_variable ] [__s2] [line 104]
!44 = !{!"0xb\00104\003\002", !1, !40}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!45 = !{!"0x100\00__result\00104\000", !44, !26, !29} ; [ DW_TAG_auto_variable ] [__result] [line 104]
!46 = !{!"0x2e\00print_array\00print_array\00\0042\001\001\000\000\00256\001\0045", !1, !26, !47, null, void (double*)* @print_array, null, null, !50} ; [ DW_TAG_subprogram ] [line 42] [local] [def] [scope 45] [print_array]
!47 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !48, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!48 = !{null, !29, !49}
!49 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!50 = !{!51, !52, !53}
!51 = !{!"0x101\00n\0016777258\000", !46, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 42]
!52 = !{!"0x101\00x\0033554475\000", !46, !26, !49} ; [ DW_TAG_arg_variable ] [x] [line 43]
!53 = !{!"0x100\00i\0046\000", !46, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 46]
!54 = !{!"0x2e\00kernel_trisolv\00kernel_trisolv\00\0058\001\001\000\000\00256\001\0062", !1, !26, !55, null, void ([4000 x double]*, double*, double*)* @kernel_trisolv, null, null, !57} ; [ DW_TAG_subprogram ] [line 58] [local] [def] [scope 62] [kernel_trisolv]
!55 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !56, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!56 = !{null, !29, !9, !49, !49}
!57 = !{!58, !59, !60, !61, !62, !63}
!58 = !{!"0x101\00n\0016777274\000", !54, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 58]
!59 = !{!"0x101\00A\0033554491\000", !54, !26, !9} ; [ DW_TAG_arg_variable ] [A] [line 59]
!60 = !{!"0x101\00x\0050331708\000", !54, !26, !49} ; [ DW_TAG_arg_variable ] [x] [line 60]
!61 = !{!"0x101\00c\0067108925\000", !54, !26, !49} ; [ DW_TAG_arg_variable ] [c] [line 61]
!62 = !{!"0x100\00i\0063\000", !54, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 63]
!63 = !{!"0x100\00j\0063\000", !54, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 63]
!64 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0027", !1, !26, !55, null, void ([4000 x double]*, double*, double*)* @init_array, null, null, !65} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 27] [init_array]
!65 = !{!66, !67, !68, !69, !70, !71}
!66 = !{!"0x101\00n\0016777239\000", !64, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 23]
!67 = !{!"0x101\00A\0033554456\000", !64, !26, !9} ; [ DW_TAG_arg_variable ] [A] [line 24]
!68 = !{!"0x101\00x\0050331673\000", !64, !26, !49} ; [ DW_TAG_arg_variable ] [x] [line 25]
!69 = !{!"0x101\00c\0067108890\000", !64, !26, !49} ; [ DW_TAG_arg_variable ] [c] [line 26]
!70 = !{!"0x100\00i\0028\000", !64, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 28]
!71 = !{!"0x100\00j\0028\000", !64, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 28]
!72 = !{i32 2, !"Dwarf Version", i32 4}
!73 = !{i32 2, !"Debug Info Version", i32 2}
!74 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!75 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!76 = !MDLocation(line: 78, column: 14, scope: !25)
!77 = !MDLocation(line: 78, column: 27, scope: !25)
!78 = !MDLocation(line: 81, column: 7, scope: !25)
!79 = !MDLocation(line: 84, column: 3, scope: !25)
!80 = !MDLocation(line: 85, column: 3, scope: !25)
!81 = !MDLocation(line: 86, column: 3, scope: !25)
!82 = !MDLocation(line: 90, column: 18, scope: !25)
!83 = !MDLocation(line: 90, column: 38, scope: !25)
!84 = !MDLocation(line: 90, column: 58, scope: !25)
!85 = !MDLocation(line: 90, column: 3, scope: !25)
!86 = !MDLocation(line: 96, column: 3, scope: !25)
!87 = !MDLocation(line: 104, column: 3, scope: !41)
!88 = !MDLocation(line: 104, column: 3, scope: !25)
!89 = !MDLocation(line: 104, column: 3, scope: !40)
!90 = !MDLocation(line: 104, column: 3, scope: !44)
!91 = !MDLocation(line: 104, column: 3, scope: !92)
!92 = !{!"0xb\004", !1, !44}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!93 = !{!94, !94, i64 0}
!94 = !{!"any pointer", !95, i64 0}
!95 = !{!"omnipotent char", !96, i64 0}
!96 = !{!"Simple C/C++ TBAA"}
!97 = !{!95, !95, i64 0}
!98 = !MDLocation(line: 104, column: 3, scope: !99)
!99 = !{!"0xb\0023", !1, !41}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!100 = !MDLocation(line: 107, column: 3, scope: !25)
!101 = !MDLocation(line: 108, column: 3, scope: !25)
!102 = !MDLocation(line: 109, column: 3, scope: !25)
!103 = !MDLocation(line: 111, column: 3, scope: !25)
!104 = !MDLocation(line: 23, column: 21, scope: !64)
!105 = !MDLocation(line: 28, column: 7, scope: !64)
!106 = !MDLocation(line: 30, column: 3, scope: !107)
!107 = !{!"0xb\0030\003\0017", !1, !64}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!108 = !MDLocation(line: 32, column: 22, scope: !109)
!109 = !{!"0xb\0031\005\0019", !1, !110}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!110 = !{!"0xb\0030\003\0018", !1, !107}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!111 = !MDLocation(line: 32, column: 21, scope: !109)
!112 = !MDLocation(line: 32, column: 14, scope: !109)
!113 = !{!114, !114, i64 0}
!114 = !{!"double", !95, i64 0}
!115 = !MDLocation(line: 32, column: 7, scope: !109)
!116 = !MDLocation(line: 28, column: 10, scope: !64)
!117 = !MDLocation(line: 33, column: 7, scope: !118)
!118 = !{!"0xb\0033\007\0020", !1, !109}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!119 = !MDLocation(line: 34, column: 27, scope: !120)
!120 = !{!"0xb\0033\007\0021", !1, !118}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!121 = !MDLocation(line: 34, column: 13, scope: !120)
!122 = !MDLocation(line: 34, column: 12, scope: !120)
!123 = !MDLocation(line: 34, column: 2, scope: !120)
!124 = !MDLocation(line: 36, column: 1, scope: !64)
!125 = !MDLocation(line: 58, column: 25, scope: !54)
!126 = !MDLocation(line: 63, column: 7, scope: !54)
!127 = !MDLocation(line: 66, column: 3, scope: !128)
!128 = !{!"0xb\0066\003\0012", !1, !54}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!129 = !MDLocation(line: 68, column: 14, scope: !130)
!130 = !{!"0xb\0067\005\0014", !1, !131}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!131 = !{!"0xb\0066\003\0013", !1, !128}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!132 = !MDLocation(line: 68, column: 7, scope: !130)
!133 = !MDLocation(line: 63, column: 10, scope: !54)
!134 = !MDLocation(line: 69, column: 24, scope: !135)
!135 = !{!"0xb\0069\007\0016", !1, !136}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!136 = !{!"0xb\0069\007\0015", !1, !130}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!137 = !MDLocation(line: 69, column: 19, scope: !135)
!138 = !MDLocation(line: 69, column: 7, scope: !136)
!139 = !MDLocation(line: 70, column: 23, scope: !135)
!140 = !MDLocation(line: 70, column: 33, scope: !135)
!141 = !MDLocation(line: 70, column: 16, scope: !135)
!142 = !MDLocation(line: 70, column: 9, scope: !135)
!143 = !MDLocation(line: 71, column: 21, scope: !130)
!144 = !MDLocation(line: 71, column: 14, scope: !130)
!145 = !MDLocation(line: 71, column: 7, scope: !130)
!146 = !MDLocation(line: 75, column: 1, scope: !54)
!147 = !MDLocation(line: 42, column: 22, scope: !46)
!148 = !MDLocation(line: 46, column: 7, scope: !46)
!149 = !MDLocation(line: 48, column: 3, scope: !150)
!150 = !{!"0xb\0048\003\008", !1, !46}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!151 = !MDLocation(line: 49, column: 14, scope: !152)
!152 = !{!"0xb\0048\0027\0010", !1, !153}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!153 = !{!"0xb\0048\003\009", !1, !150}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!154 = !MDLocation(line: 49, column: 44, scope: !152)
!155 = !MDLocation(line: 49, column: 5, scope: !152)
!156 = !MDLocation(line: 50, column: 9, scope: !157)
!157 = !{!"0xb\0050\009\0011", !1, !152}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!158 = !MDLocation(line: 50, column: 9, scope: !152)
!159 = !MDLocation(line: 50, column: 31, scope: !160)
!160 = !{!"0xb\001", !1, !157}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/trisolv/trisolv.c]
!161 = !MDLocation(line: 50, column: 22, scope: !157)
!162 = !MDLocation(line: 52, column: 1, scope: !46)
