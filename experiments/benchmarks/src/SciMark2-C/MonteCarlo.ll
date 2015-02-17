; ModuleID = 'MonteCarlo.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Random_struct = type { [17 x i32], i32, i32, i32, i32, double, double, double }

; Function Attrs: nounwind readnone uwtable
define double @MonteCarlo_num_flops(i32 %Num_samples) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %Num_samples, i64 0, metadata !12, metadata !46), !dbg !47
  %conv = sitofp i32 %Num_samples to double, !dbg !48
  %mul = fmul double %conv, 4.000000e+00, !dbg !49
  ret double %mul, !dbg !50
}

; Function Attrs: nounwind uwtable
define double @MonteCarlo_integrate(i32 %Num_samples) #1 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %Num_samples, i64 0, metadata !15, metadata !46), !dbg !51
  %call = tail call %struct.Random_struct* @new_Random_seed(i32 113) #4, !dbg !52
  tail call void @llvm.dbg.value(metadata %struct.Random_struct* %call, i64 0, metadata !16, metadata !46), !dbg !53
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !33, metadata !46), !dbg !54
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !34, metadata !46), !dbg !55
  %cmp14 = icmp sgt i32 %Num_samples, 0, !dbg !56
  br i1 %cmp14, label %for.body.lr.ph, label %for.end, !dbg !57

for.body.lr.ph:                                   ; preds = %entry
  %0 = add i32 %Num_samples, -1, !dbg !57
  br label %for.body, !dbg !57

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %under_curve.016 = phi i32 [ 0, %for.body.lr.ph ], [ %under_curve.1, %for.body ]
  %count.015 = phi i32 [ 0, %for.body.lr.ph ], [ %inc5, %for.body ]
  %call1 = tail call double @Random_nextDouble(%struct.Random_struct* %call) #4, !dbg !58
  tail call void @llvm.dbg.value(metadata double %call1, i64 0, metadata !35, metadata !46), !dbg !59
  %call2 = tail call double @Random_nextDouble(%struct.Random_struct* %call) #4, !dbg !60
  tail call void @llvm.dbg.value(metadata double %call2, i64 0, metadata !39, metadata !46), !dbg !61
  %mul = fmul double %call1, %call1, !dbg !62
  %mul3 = fmul double %call2, %call2, !dbg !64
  %add = fadd double %mul, %mul3, !dbg !62
  %not.cmp4 = fcmp ole double %add, 1.000000e+00, !dbg !65
  %inc = zext i1 %not.cmp4 to i32, !dbg !65
  %under_curve.1 = add nsw i32 %inc, %under_curve.016, !dbg !65
  %inc5 = add nuw nsw i32 %count.015, 1, !dbg !66
  tail call void @llvm.dbg.value(metadata i32 %inc5, i64 0, metadata !34, metadata !46), !dbg !55
  %exitcond = icmp eq i32 %count.015, %0, !dbg !57
  br i1 %exitcond, label %for.cond.for.end_crit_edge, label %for.body, !dbg !57

for.cond.for.end_crit_edge:                       ; preds = %for.body
  %under_curve.1.lcssa = phi i32 [ %under_curve.1, %for.body ]
  %phitmp = sitofp i32 %under_curve.1.lcssa to double, !dbg !57
  br label %for.end, !dbg !57

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry
  %under_curve.0.lcssa = phi double [ %phitmp, %for.cond.for.end_crit_edge ], [ 0.000000e+00, %entry ]
  tail call void @Random_delete(%struct.Random_struct* %call) #4, !dbg !67
  %conv6 = sitofp i32 %Num_samples to double, !dbg !68
  %div = fdiv double %under_curve.0.lcssa, %conv6, !dbg !69
  %mul7 = fmul double %div, 4.000000e+00, !dbg !70
  ret double %mul7, !dbg !71
}

declare %struct.Random_struct* @new_Random_seed(i32) #2

declare double @Random_nextDouble(%struct.Random_struct*) #2

declare void @Random_delete(%struct.Random_struct*) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!43, !44}
!llvm.ident = !{!45}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !5, !40, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/MonteCarlo.c] [DW_LANG_C99]
!1 = !{!"MonteCarlo.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!5 = !{!6, !13}
!6 = !{!"0x2e\00MonteCarlo_num_flops\00MonteCarlo_num_flops\00\0035\000\001\000\000\00256\001\0036", !1, !7, !8, null, double (i32)* @MonteCarlo_num_flops, null, null, !11} ; [ DW_TAG_subprogram ] [line 35] [def] [scope 36] [MonteCarlo_num_flops]
!7 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/MonteCarlo.c]
!8 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !9, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = !{!4, !10}
!10 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!11 = !{!12}
!12 = !{!"0x101\00Num_samples\0016777251\000", !6, !7, !10} ; [ DW_TAG_arg_variable ] [Num_samples] [line 35]
!13 = !{!"0x2e\00MonteCarlo_integrate\00MonteCarlo_integrate\00\0045\000\001\000\000\00256\001\0046", !1, !7, !8, null, double (i32)* @MonteCarlo_integrate, null, null, !14} ; [ DW_TAG_subprogram ] [line 45] [def] [scope 46] [MonteCarlo_integrate]
!14 = !{!15, !16, !33, !34, !35, !39}
!15 = !{!"0x101\00Num_samples\0016777261\000", !13, !7, !10} ; [ DW_TAG_arg_variable ] [Num_samples] [line 45]
!16 = !{!"0x100\00R\0049\000", !13, !7, !17}      ; [ DW_TAG_auto_variable ] [R] [line 49]
!17 = !{!"0x16\00Random\0012\000\000\000\000", !18, null, !19} ; [ DW_TAG_typedef ] [Random] [line 12, size 0, align 0, offset 0] [from ]
!18 = !{!"./Random.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C"}
!19 = !{!"0xf\00\000\0064\0064\000\000", null, null, !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!20 = !{!"0x13\00\001\00896\0064\000\000\000", !18, null, null, !21, null, null, null} ; [ DW_TAG_structure_type ] [line 1, size 896, align 64, offset 0] [def] [from ]
!21 = !{!22, !26, !27, !28, !29, !30, !31, !32}
!22 = !{!"0xd\00m\003\00544\0032\000\000", !18, !20, !23} ; [ DW_TAG_member ] [m] [line 3, size 544, align 32, offset 0] [from ]
!23 = !{!"0x1\00\000\00544\0032\000\000\000", null, null, !10, !24, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 544, align 32, offset 0] [from int]
!24 = !{!25}
!25 = !{!"0x21\000\0017"}                         ; [ DW_TAG_subrange_type ] [0, 16]
!26 = !{!"0xd\00seed\004\0032\0032\00544\000", !18, !20, !10} ; [ DW_TAG_member ] [seed] [line 4, size 32, align 32, offset 544] [from int]
!27 = !{!"0xd\00i\005\0032\0032\00576\000", !18, !20, !10} ; [ DW_TAG_member ] [i] [line 5, size 32, align 32, offset 576] [from int]
!28 = !{!"0xd\00j\006\0032\0032\00608\000", !18, !20, !10} ; [ DW_TAG_member ] [j] [line 6, size 32, align 32, offset 608] [from int]
!29 = !{!"0xd\00haveRange\007\0032\0032\00640\000", !18, !20, !10} ; [ DW_TAG_member ] [haveRange] [line 7, size 32, align 32, offset 640] [from int]
!30 = !{!"0xd\00left\008\0064\0064\00704\000", !18, !20, !4} ; [ DW_TAG_member ] [left] [line 8, size 64, align 64, offset 704] [from double]
!31 = !{!"0xd\00right\009\0064\0064\00768\000", !18, !20, !4} ; [ DW_TAG_member ] [right] [line 9, size 64, align 64, offset 768] [from double]
!32 = !{!"0xd\00width\0010\0064\0064\00832\000", !18, !20, !4} ; [ DW_TAG_member ] [width] [line 10, size 64, align 64, offset 832] [from double]
!33 = !{!"0x100\00under_curve\0052\000", !13, !7, !10} ; [ DW_TAG_auto_variable ] [under_curve] [line 52]
!34 = !{!"0x100\00count\0053\000", !13, !7, !10}  ; [ DW_TAG_auto_variable ] [count] [line 53]
!35 = !{!"0x100\00x\0057\000", !36, !7, !4}       ; [ DW_TAG_auto_variable ] [x] [line 57]
!36 = !{!"0xb\0056\009\002", !1, !37}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/MonteCarlo.c]
!37 = !{!"0xb\0055\009\001", !1, !38}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/MonteCarlo.c]
!38 = !{!"0xb\0055\009\000", !1, !13}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/MonteCarlo.c]
!39 = !{!"0x100\00y\0058\000", !36, !7, !4}       ; [ DW_TAG_auto_variable ] [y] [line 58]
!40 = !{!41}
!41 = !{!"0x34\00SEED\00SEED\00\0032\001\001", null, !7, !42, i32 113, null} ; [ DW_TAG_variable ] [SEED] [line 32] [local] [def]
!42 = !{!"0x26\00\000\000\000\000\000", null, null, !10} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!43 = !{i32 2, !"Dwarf Version", i32 4}
!44 = !{i32 2, !"Debug Info Version", i32 2}
!45 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!46 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!47 = !MDLocation(line: 35, column: 37, scope: !6)
!48 = !MDLocation(line: 39, column: 17, scope: !6)
!49 = !MDLocation(line: 39, column: 16, scope: !6)
!50 = !MDLocation(line: 39, column: 9, scope: !6)
!51 = !MDLocation(line: 45, column: 37, scope: !13)
!52 = !MDLocation(line: 49, column: 20, scope: !13)
!53 = !MDLocation(line: 49, column: 16, scope: !13)
!54 = !MDLocation(line: 52, column: 13, scope: !13)
!55 = !MDLocation(line: 53, column: 13, scope: !13)
!56 = !MDLocation(line: 55, column: 23, scope: !37)
!57 = !MDLocation(line: 55, column: 9, scope: !38)
!58 = !MDLocation(line: 57, column: 23, scope: !36)
!59 = !MDLocation(line: 57, column: 20, scope: !36)
!60 = !MDLocation(line: 58, column: 23, scope: !36)
!61 = !MDLocation(line: 58, column: 20, scope: !36)
!62 = !MDLocation(line: 60, column: 18, scope: !63)
!63 = !{!"0xb\0060\0018\003", !1, !36}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/MonteCarlo.c]
!64 = !MDLocation(line: 60, column: 24, scope: !63)
!65 = !MDLocation(line: 60, column: 18, scope: !36)
!66 = !MDLocation(line: 55, column: 42, scope: !37)
!67 = !MDLocation(line: 65, column: 9, scope: !13)
!68 = !MDLocation(line: 67, column: 40, scope: !13)
!69 = !MDLocation(line: 67, column: 17, scope: !13)
!70 = !MDLocation(line: 67, column: 16, scope: !13)
!71 = !MDLocation(line: 67, column: 9, scope: !13)
