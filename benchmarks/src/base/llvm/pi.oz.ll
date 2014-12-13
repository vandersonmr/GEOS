; ModuleID = 'pi.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str1 = private unnamed_addr constant [45 x i8] c" x = %9.6f    y = %12.2f  low = %8d j = %7d\0A\00", align 1
@.str2 = private unnamed_addr constant [37 x i8] c"Pi = %9.6f ztot = %12.2f itot = %8d\0A\00", align 1
@str = private unnamed_addr constant [15 x i8] c"Starting PI...\00"

; Function Attrs: minsize nounwind optsize uwtable
define void @myadd(float* nocapture %sum, float* nocapture readonly %addend) #0 {
  tail call void @llvm.dbg.value(metadata !{float* %sum}, i64 0, metadata !11), !dbg !41
  tail call void @llvm.dbg.value(metadata !{float* %addend}, i64 0, metadata !12), !dbg !41
  %1 = load float* %sum, align 4, !dbg !42, !tbaa !43
  %2 = load float* %addend, align 4, !dbg !42, !tbaa !43
  %3 = fadd float %1, %2, !dbg !42
  store float %3, float* %sum, align 4, !dbg !42, !tbaa !43
  ret void, !dbg !47
}

; Function Attrs: minsize nounwind optsize uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !21), !dbg !48
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !22), !dbg !48
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([15 x i8]* @str, i64 0, i64 0)), !dbg !49
  tail call void @llvm.dbg.value(metadata !50, i64 0, metadata !23), !dbg !51
  tail call void @llvm.dbg.value(metadata !50, i64 0, metadata !52), !dbg !56
  tail call void @llvm.dbg.value(metadata !50, i64 0, metadata !23), !dbg !57
  tail call void @llvm.dbg.value(metadata !58, i64 0, metadata !32), !dbg !59
  tail call void @llvm.dbg.value(metadata !60, i64 0, metadata !34), !dbg !61
  tail call void @llvm.dbg.value(metadata !62, i64 0, metadata !24), !dbg !63
  tail call void @llvm.dbg.value(metadata !64, i64 0, metadata !25), !dbg !65
  tail call void @llvm.dbg.value(metadata !66, i64 0, metadata !26), !dbg !67
  tail call void @llvm.dbg.value(metadata !68, i64 0, metadata !35), !dbg !69
  tail call void @llvm.dbg.value(metadata !58, i64 0, metadata !36), !dbg !70
  br label %1, !dbg !70

; <label>:1                                       ; preds = %1, %0
  %yran.08 = phi float [ 7.597591e+06, %0 ], [ %phitmp4, %1 ]
  %j.07 = phi i64 [ 1, %0 ], [ %18, %1 ]
  %ixran.06 = phi i64 [ 65396, %0 ], [ %phitmp3, %1 ]
  %low.05 = phi i64 [ 1, %0 ], [ %low.1, %1 ]
  %2 = phi float [ 0.000000e+00, %0 ], [ %16, %1 ]
  tail call void @llvm.dbg.value(metadata !{i64 %ixran.06}, i64 0, metadata !34), !dbg !71
  %3 = sitofp i64 %ixran.06 to float, !dbg !72
  tail call void @llvm.dbg.value(metadata !73, i64 0, metadata !27), !dbg !72
  tail call void @llvm.dbg.value(metadata !{float %yran.08}, i64 0, metadata !31), !dbg !74
  %4 = fdiv float %yran.08, 5.471000e+03, !dbg !75
  %5 = fptosi float %4 to i64, !dbg !75
  %6 = sitofp i64 %5 to float, !dbg !75
  %7 = fmul float %6, 5.471000e+03, !dbg !75
  %8 = fsub float %yran.08, %7, !dbg !75
  tail call void @llvm.dbg.value(metadata !{float %8}, i64 0, metadata !24), !dbg !75
  %9 = insertelement <2 x float> undef, float %3, i32 0, !dbg !72
  %10 = insertelement <2 x float> %9, float %8, i32 1, !dbg !72
  %11 = fdiv <2 x float> %10, <float 7.438300e+04, float 5.471000e+03>, !dbg !72
  tail call void @llvm.dbg.value(metadata !73, i64 0, metadata !28), !dbg !76
  %12 = fmul <2 x float> %11, %11, !dbg !77
  %13 = extractelement <2 x float> %12, i32 0, !dbg !77
  %14 = extractelement <2 x float> %12, i32 1, !dbg !77
  %15 = fadd float %13, %14, !dbg !77
  tail call void @llvm.dbg.value(metadata !{float %15}, i64 0, metadata !29), !dbg !77
  tail call void @llvm.dbg.value(metadata !{float %15}, i64 0, metadata !78), !dbg !56
  tail call void @llvm.dbg.value(metadata !{float %15}, i64 0, metadata !29), !dbg !79
  %16 = fadd float %2, %15, !dbg !81
  tail call void @llvm.dbg.value(metadata !{float %16}, i64 0, metadata !23), !dbg !81
  tail call void @llvm.dbg.value(metadata !{float %16}, i64 0, metadata !52), !dbg !56
  tail call void @llvm.dbg.value(metadata !{float %16}, i64 0, metadata !23), !dbg !57
  %not. = fcmp ole float %15, 1.000000e+00, !dbg !79
  %17 = zext i1 %not. to i64, !dbg !79
  %low.1 = add nsw i64 %17, %low.05, !dbg !79
  %18 = add nsw i64 %j.07, 1, !dbg !70
  tail call void @llvm.dbg.value(metadata !82, i64 0, metadata !36), !dbg !70
  %phitmp2 = mul i64 %ixran.06, 27611, !dbg !70
  %phitmp3 = srem i64 %phitmp2, 74383, !dbg !70
  %phitmp4 = fmul float %8, 1.307000e+03, !dbg !70
  %exitcond = icmp eq i64 %18, 40000001, !dbg !70
  br i1 %exitcond, label %19, label %1, !dbg !70

; <label>:19                                      ; preds = %1
  %20 = extractelement <2 x float> %11, i32 0, !dbg !70
  %phitmp.le = fpext float %20 to double, !dbg !70
  %21 = extractelement <2 x float> %11, i32 1, !dbg !70
  %phitmp1.le = fpext float %21 to double, !dbg !70
  %22 = trunc i64 %low.1 to i32, !dbg !83
  %23 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([45 x i8]* @.str1, i64 0, i64 0), double %phitmp.le, double %phitmp1.le, i32 %22, i32 40000001) #4, !dbg !83
  %24 = sitofp i64 %low.1 to float, !dbg !84
  %25 = fpext float %24 to double, !dbg !84
  %26 = fmul double %25, 4.000000e+00, !dbg !84
  %27 = fdiv double %26, 4.000000e+07, !dbg !84
  %28 = fptrunc double %27 to float, !dbg !84
  tail call void @llvm.dbg.value(metadata !{float %28}, i64 0, metadata !30), !dbg !84
  %29 = fpext float %28 to double, !dbg !57
  %30 = fpext float %16 to double, !dbg !57
  %31 = fmul double %30, 0.000000e+00, !dbg !57
  %32 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str2, i64 0, i64 0), double %29, double %31, i32 40000000) #4, !dbg !57
  ret i32 0, !dbg !85
}

; Function Attrs: minsize nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #3

attributes #0 = { minsize nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { minsize nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }
attributes #4 = { minsize nounwind optsize }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!38, !39}
!llvm.ident = !{!40}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/pi.c] [DW_LANG_C99]
!1 = metadata !{metadata !"pi.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !13}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"myadd", metadata !"myadd", metadata !"", i32 12, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (float*, float*)* @myadd, null, null, metadata !10, i32 12} ; [ DW_TAG_subprogram ] [line 12] [def] [myadd]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/pi.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null, metadata !8, metadata !8}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!9 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!10 = metadata !{metadata !11, metadata !12}
!11 = metadata !{i32 786689, metadata !4, metadata !"sum", metadata !5, i32 16777228, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sum] [line 12]
!12 = metadata !{i32 786689, metadata !4, metadata !"addend", metadata !5, i32 33554444, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [addend] [line 12]
!13 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 21, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !20, i32 21} ; [ DW_TAG_subprogram ] [line 21] [def] [main]
!14 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = metadata !{metadata !16, metadata !16, metadata !17}
!16 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!17 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!18 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!19 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!20 = metadata !{metadata !21, metadata !22, metadata !23, metadata !24, metadata !25, metadata !26, metadata !27, metadata !28, metadata !29, metadata !30, metadata !31, metadata !32, metadata !34, metadata !35, metadata !36, metadata !37}
!21 = metadata !{i32 786689, metadata !13, metadata !"argc", metadata !5, i32 16777237, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 21]
!22 = metadata !{i32 786689, metadata !13, metadata !"argv", metadata !5, i32 33554453, metadata !17, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 21]
!23 = metadata !{i32 786688, metadata !13, metadata !"ztot", metadata !5, i32 22, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ztot] [line 22]
!24 = metadata !{i32 786688, metadata !13, metadata !"yran", metadata !5, i32 22, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [yran] [line 22]
!25 = metadata !{i32 786688, metadata !13, metadata !"ymult", metadata !5, i32 22, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ymult] [line 22]
!26 = metadata !{i32 786688, metadata !13, metadata !"ymod", metadata !5, i32 22, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ymod] [line 22]
!27 = metadata !{i32 786688, metadata !13, metadata !"x", metadata !5, i32 22, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 22]
!28 = metadata !{i32 786688, metadata !13, metadata !"y", metadata !5, i32 22, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [y] [line 22]
!29 = metadata !{i32 786688, metadata !13, metadata !"z", metadata !5, i32 22, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [z] [line 22]
!30 = metadata !{i32 786688, metadata !13, metadata !"pi", metadata !5, i32 22, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pi] [line 22]
!31 = metadata !{i32 786688, metadata !13, metadata !"prod", metadata !5, i32 22, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [prod] [line 22]
!32 = metadata !{i32 786688, metadata !13, metadata !"low", metadata !5, i32 23, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [low] [line 23]
!33 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!34 = metadata !{i32 786688, metadata !13, metadata !"ixran", metadata !5, i32 23, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ixran] [line 23]
!35 = metadata !{i32 786688, metadata !13, metadata !"itot", metadata !5, i32 23, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [itot] [line 23]
!36 = metadata !{i32 786688, metadata !13, metadata !"j", metadata !5, i32 23, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 23]
!37 = metadata !{i32 786688, metadata !13, metadata !"iprod", metadata !5, i32 23, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [iprod] [line 23]
!38 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!39 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!40 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!41 = metadata !{i32 12, i32 0, metadata !4, null}
!42 = metadata !{i32 17, i32 0, metadata !4, null}
!43 = metadata !{metadata !44, metadata !44, i64 0}
!44 = metadata !{metadata !"float", metadata !45, i64 0}
!45 = metadata !{metadata !"omnipotent char", metadata !46, i64 0}
!46 = metadata !{metadata !"Simple C/C++ TBAA"}
!47 = metadata !{i32 18, i32 0, metadata !4, null}
!48 = metadata !{i32 21, i32 0, metadata !13, null}
!49 = metadata !{i32 25, i32 0, metadata !13, null}
!50 = metadata !{float 0.000000e+00}
!51 = metadata !{i32 26, i32 0, metadata !13, null}
!52 = metadata !{i32 786689, metadata !4, metadata !"sum", metadata !5, i32 16777228, metadata !8, i32 0, metadata !53} ; [ DW_TAG_arg_variable ] [sum] [line 12]
!53 = metadata !{i32 55, i32 0, metadata !54, null}
!54 = metadata !{i32 786443, metadata !1, metadata !55, i32 38, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/pi.c]
!55 = metadata !{i32 786443, metadata !1, metadata !13, i32 38, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/pi.c]
!56 = metadata !{i32 12, i32 0, metadata !4, metadata !53}
!57 = metadata !{i32 62, i32 0, metadata !13, null}
!58 = metadata !{i64 1}
!59 = metadata !{i32 27, i32 0, metadata !13, null}
!60 = metadata !{i64 1907}
!61 = metadata !{i32 28, i32 0, metadata !13, null}
!62 = metadata !{float 5.813000e+03}
!63 = metadata !{i32 29, i32 0, metadata !13, null}
!64 = metadata !{float 1.307000e+03}
!65 = metadata !{i32 30, i32 0, metadata !13, null}
!66 = metadata !{float 5.471000e+03}
!67 = metadata !{i32 31, i32 0, metadata !13, null}
!68 = metadata !{i64 40000000}
!69 = metadata !{i32 35, i32 0, metadata !13, null}
!70 = metadata !{i32 38, i32 0, metadata !55, null}
!71 = metadata !{i32 49, i32 0, metadata !54, null}
!72 = metadata !{i32 50, i32 0, metadata !54, null}
!73 = metadata !{float undef}
!74 = metadata !{i32 51, i32 0, metadata !54, null}
!75 = metadata !{i32 52, i32 0, metadata !54, null}
!76 = metadata !{i32 53, i32 0, metadata !54, null}
!77 = metadata !{i32 54, i32 0, metadata !54, null}
!78 = metadata !{i32 786689, metadata !4, metadata !"addend", metadata !5, i32 33554444, metadata !8, i32 0, metadata !53} ; [ DW_TAG_arg_variable ] [addend] [line 12]
!79 = metadata !{i32 56, i32 0, metadata !80, null}
!80 = metadata !{i32 786443, metadata !1, metadata !54, i32 56, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/pi.c]
!81 = metadata !{i32 17, i32 0, metadata !4, metadata !53}
!82 = metadata !{i64 40000001}
!83 = metadata !{i32 60, i32 0, metadata !13, null}
!84 = metadata !{i32 61, i32 0, metadata !13, null}
!85 = metadata !{i32 63, i32 0, metadata !13, null}
