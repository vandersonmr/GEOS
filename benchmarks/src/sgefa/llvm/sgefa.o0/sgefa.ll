; ModuleID = 'sgefa.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.FULL = type { i32, i32, [1000 x float*] }

; Function Attrs: nounwind uwtable
define i32 @sgefa(%struct.FULL* %a, i32* %ipvt) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.FULL*, align 8
  %3 = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %nm1 = alloca i32, align 4
  %info = alloca i32, align 4
  %n = alloca i32, align 4
  %t = alloca float, align 4
  %akk = alloca float*, align 8
  %alk = alloca float*, align 8
  %aij = alloca float*, align 8
  %mik = alloca float*, align 8
  store %struct.FULL* %a, %struct.FULL** %2, align 8
  call void @llvm.dbg.declare(metadata !{%struct.FULL** %2}, metadata !25), !dbg !26
  store i32* %ipvt, i32** %3, align 8
  call void @llvm.dbg.declare(metadata !{i32** %3}, metadata !27), !dbg !28
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !29), !dbg !30
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !31), !dbg !30
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !32), !dbg !33
  call void @llvm.dbg.declare(metadata !{i32* %l}, metadata !34), !dbg !33
  call void @llvm.dbg.declare(metadata !{i32* %nm1}, metadata !35), !dbg !33
  call void @llvm.dbg.declare(metadata !{i32* %info}, metadata !36), !dbg !33
  call void @llvm.dbg.declare(metadata !{i32* %n}, metadata !37), !dbg !33
  call void @llvm.dbg.declare(metadata !{float* %t}, metadata !38), !dbg !39
  call void @llvm.dbg.declare(metadata !{float** %akk}, metadata !40), !dbg !39
  call void @llvm.dbg.declare(metadata !{float** %alk}, metadata !41), !dbg !39
  call void @llvm.dbg.declare(metadata !{float** %aij}, metadata !42), !dbg !39
  call void @llvm.dbg.declare(metadata !{float** %mik}, metadata !43), !dbg !39
  %4 = load %struct.FULL** %2, align 8, !dbg !44
  %5 = getelementptr inbounds %struct.FULL* %4, i32 0, i32 0, !dbg !44
  %6 = load i32* %5, align 4, !dbg !44
  %7 = load %struct.FULL** %2, align 8, !dbg !44
  %8 = getelementptr inbounds %struct.FULL* %7, i32 0, i32 1, !dbg !44
  %9 = load i32* %8, align 4, !dbg !44
  %10 = icmp ne i32 %6, %9, !dbg !44
  br i1 %10, label %11, label %12, !dbg !44

; <label>:11                                      ; preds = %0
  store i32 -1, i32* %1, !dbg !44
  br label %217, !dbg !44

; <label>:12                                      ; preds = %0
  %13 = load %struct.FULL** %2, align 8, !dbg !46
  %14 = getelementptr inbounds %struct.FULL* %13, i32 0, i32 0, !dbg !46
  %15 = load i32* %14, align 4, !dbg !46
  store i32 %15, i32* %n, align 4, !dbg !46
  %16 = load i32* %n, align 4, !dbg !47
  %17 = sub nsw i32 %16, 1, !dbg !47
  store i32 %17, i32* %nm1, align 4, !dbg !47
  %18 = load %struct.FULL** %2, align 8, !dbg !48
  %19 = getelementptr inbounds %struct.FULL* %18, i32 0, i32 2, !dbg !48
  %20 = getelementptr inbounds [1000 x float*]* %19, i32 0, i64 0, !dbg !48
  %21 = load float** %20, align 8, !dbg !48
  store float* %21, float** %akk, align 8, !dbg !48
  store i32 0, i32* %info, align 4, !dbg !49
  %22 = load i32* %n, align 4, !dbg !50
  %23 = icmp slt i32 %22, 2, !dbg !50
  br i1 %23, label %24, label %25, !dbg !50

; <label>:24                                      ; preds = %12
  br label %206, !dbg !50

; <label>:25                                      ; preds = %12
  store i32 0, i32* %k, align 4, !dbg !52
  br label %26, !dbg !52

; <label>:26                                      ; preds = %200, %25
  %27 = load i32* %k, align 4, !dbg !52
  %28 = load i32* %nm1, align 4, !dbg !52
  %29 = icmp slt i32 %27, %28, !dbg !52
  br i1 %29, label %30, label %205, !dbg !52

; <label>:30                                      ; preds = %26
  %31 = load i32* %k, align 4, !dbg !54
  %32 = sext i32 %31 to i64, !dbg !54
  %33 = load %struct.FULL** %2, align 8, !dbg !54
  %34 = getelementptr inbounds %struct.FULL* %33, i32 0, i32 2, !dbg !54
  %35 = getelementptr inbounds [1000 x float*]* %34, i32 0, i64 %32, !dbg !54
  %36 = load float** %35, align 8, !dbg !54
  %37 = load i32* %k, align 4, !dbg !54
  %38 = sext i32 %37 to i64, !dbg !54
  %39 = getelementptr inbounds float* %36, i64 %38, !dbg !54
  store float* %39, float** %akk, align 8, !dbg !54
  %40 = load i32* %n, align 4, !dbg !56
  %41 = load i32* %k, align 4, !dbg !56
  %42 = sub nsw i32 %40, %41, !dbg !56
  %43 = load float** %akk, align 8, !dbg !56
  %44 = call i32 (i32, float*, i32, ...)* bitcast (i32 (...)* @isamax to i32 (i32, float*, i32, ...)*)(i32 %42, float* %43, i32 1), !dbg !56
  %45 = load i32* %k, align 4, !dbg !56
  %46 = add nsw i32 %44, %45, !dbg !56
  store i32 %46, i32* %l, align 4, !dbg !56
  %47 = load i32* %l, align 4, !dbg !57
  %48 = load i32** %3, align 8, !dbg !57
  store i32 %47, i32* %48, align 4, !dbg !57
  %49 = load i32* %k, align 4, !dbg !58
  %50 = sext i32 %49 to i64, !dbg !58
  %51 = load %struct.FULL** %2, align 8, !dbg !58
  %52 = getelementptr inbounds %struct.FULL* %51, i32 0, i32 2, !dbg !58
  %53 = getelementptr inbounds [1000 x float*]* %52, i32 0, i64 %50, !dbg !58
  %54 = load float** %53, align 8, !dbg !58
  %55 = load i32* %l, align 4, !dbg !58
  %56 = sext i32 %55 to i64, !dbg !58
  %57 = getelementptr inbounds float* %54, i64 %56, !dbg !58
  store float* %57, float** %alk, align 8, !dbg !58
  %58 = load float** %alk, align 8, !dbg !59
  %59 = load float* %58, align 4, !dbg !59
  %60 = fpext float %59 to double, !dbg !59
  %61 = fcmp oeq double %60, 0.000000e+00, !dbg !59
  br i1 %61, label %62, label %64, !dbg !59

; <label>:62                                      ; preds = %30
  %63 = load i32* %k, align 4, !dbg !61
  store i32 %63, i32* %info, align 4, !dbg !61
  br label %200, !dbg !63

; <label>:64                                      ; preds = %30
  %65 = load i32* %l, align 4, !dbg !64
  %66 = load i32* %k, align 4, !dbg !64
  %67 = icmp ne i32 %65, %66, !dbg !64
  br i1 %67, label %68, label %76, !dbg !64

; <label>:68                                      ; preds = %64
  %69 = load float** %alk, align 8, !dbg !66
  %70 = load float* %69, align 4, !dbg !66
  store float %70, float* %t, align 4, !dbg !66
  %71 = load float** %akk, align 8, !dbg !68
  %72 = load float* %71, align 4, !dbg !68
  %73 = load float** %alk, align 8, !dbg !68
  store float %72, float* %73, align 4, !dbg !68
  %74 = load float* %t, align 4, !dbg !69
  %75 = load float** %akk, align 8, !dbg !69
  store float %74, float* %75, align 4, !dbg !69
  br label %76, !dbg !70

; <label>:76                                      ; preds = %68, %64
  %77 = load float** %akk, align 8, !dbg !71
  %78 = load float* %77, align 4, !dbg !71
  %79 = fpext float %78 to double, !dbg !71
  %80 = fdiv double -1.000000e+00, %79, !dbg !71
  %81 = fptrunc double %80 to float, !dbg !71
  store float %81, float* %t, align 4, !dbg !71
  %82 = load i32* %k, align 4, !dbg !72
  %83 = add nsw i32 %82, 1, !dbg !72
  store i32 %83, i32* %i, align 4, !dbg !72
  %84 = load float** %akk, align 8, !dbg !72
  %85 = getelementptr inbounds float* %84, i64 1, !dbg !72
  store float* %85, float** %mik, align 8, !dbg !72
  br label %86, !dbg !72

; <label>:86                                      ; preds = %95, %76
  %87 = load i32* %i, align 4, !dbg !72
  %88 = load i32* %n, align 4, !dbg !72
  %89 = icmp slt i32 %87, %88, !dbg !72
  br i1 %89, label %90, label %100, !dbg !72

; <label>:90                                      ; preds = %86
  %91 = load float* %t, align 4, !dbg !74
  %92 = load float** %mik, align 8, !dbg !74
  %93 = load float* %92, align 4, !dbg !74
  %94 = fmul float %93, %91, !dbg !74
  store float %94, float* %92, align 4, !dbg !74
  br label %95, !dbg !74

; <label>:95                                      ; preds = %90
  %96 = load i32* %i, align 4, !dbg !72
  %97 = add nsw i32 %96, 1, !dbg !72
  store i32 %97, i32* %i, align 4, !dbg !72
  %98 = load float** %mik, align 8, !dbg !72
  %99 = getelementptr inbounds float* %98, i32 1, !dbg !72
  store float* %99, float** %mik, align 8, !dbg !72
  br label %86, !dbg !72

; <label>:100                                     ; preds = %86
  %101 = load i32* %k, align 4, !dbg !75
  %102 = add nsw i32 %101, 1, !dbg !75
  store i32 %102, i32* %j, align 4, !dbg !75
  br label %103, !dbg !75

; <label>:103                                     ; preds = %196, %100
  %104 = load i32* %j, align 4, !dbg !75
  %105 = load i32* %n, align 4, !dbg !75
  %106 = icmp slt i32 %104, %105, !dbg !75
  br i1 %106, label %107, label %199, !dbg !75

; <label>:107                                     ; preds = %103
  %108 = load i32* %j, align 4, !dbg !77
  %109 = sext i32 %108 to i64, !dbg !77
  %110 = load %struct.FULL** %2, align 8, !dbg !77
  %111 = getelementptr inbounds %struct.FULL* %110, i32 0, i32 2, !dbg !77
  %112 = getelementptr inbounds [1000 x float*]* %111, i32 0, i64 %109, !dbg !77
  %113 = load float** %112, align 8, !dbg !77
  %114 = load i32* %k, align 4, !dbg !77
  %115 = sext i32 %114 to i64, !dbg !77
  %116 = getelementptr inbounds float* %113, i64 %115, !dbg !77
  %117 = load float* %116, align 4, !dbg !77
  store float %117, float* %t, align 4, !dbg !77
  %118 = load i32* %l, align 4, !dbg !79
  %119 = load i32* %k, align 4, !dbg !79
  %120 = icmp ne i32 %118, %119, !dbg !79
  br i1 %120, label %121, label %161, !dbg !79

; <label>:121                                     ; preds = %107
  %122 = load i32* %j, align 4, !dbg !81
  %123 = sext i32 %122 to i64, !dbg !81
  %124 = load %struct.FULL** %2, align 8, !dbg !81
  %125 = getelementptr inbounds %struct.FULL* %124, i32 0, i32 2, !dbg !81
  %126 = getelementptr inbounds [1000 x float*]* %125, i32 0, i64 %123, !dbg !81
  %127 = load float** %126, align 8, !dbg !81
  %128 = load i32* %l, align 4, !dbg !81
  %129 = sext i32 %128 to i64, !dbg !81
  %130 = getelementptr inbounds float* %127, i64 %129, !dbg !81
  %131 = load float* %130, align 4, !dbg !81
  %132 = load i32* %j, align 4, !dbg !81
  %133 = sext i32 %132 to i64, !dbg !81
  %134 = load %struct.FULL** %2, align 8, !dbg !81
  %135 = getelementptr inbounds %struct.FULL* %134, i32 0, i32 2, !dbg !81
  %136 = getelementptr inbounds [1000 x float*]* %135, i32 0, i64 %133, !dbg !81
  %137 = load float** %136, align 8, !dbg !81
  %138 = load i32* %k, align 4, !dbg !81
  %139 = sext i32 %138 to i64, !dbg !81
  %140 = getelementptr inbounds float* %137, i64 %139, !dbg !81
  store float %131, float* %140, align 4, !dbg !81
  %141 = load float* %t, align 4, !dbg !83
  %142 = load i32* %j, align 4, !dbg !83
  %143 = sext i32 %142 to i64, !dbg !83
  %144 = load %struct.FULL** %2, align 8, !dbg !83
  %145 = getelementptr inbounds %struct.FULL* %144, i32 0, i32 2, !dbg !83
  %146 = getelementptr inbounds [1000 x float*]* %145, i32 0, i64 %143, !dbg !83
  %147 = load float** %146, align 8, !dbg !83
  %148 = load i32* %l, align 4, !dbg !83
  %149 = sext i32 %148 to i64, !dbg !83
  %150 = getelementptr inbounds float* %147, i64 %149, !dbg !83
  store float %141, float* %150, align 4, !dbg !83
  %151 = load i32* %j, align 4, !dbg !84
  %152 = sext i32 %151 to i64, !dbg !84
  %153 = load %struct.FULL** %2, align 8, !dbg !84
  %154 = getelementptr inbounds %struct.FULL* %153, i32 0, i32 2, !dbg !84
  %155 = getelementptr inbounds [1000 x float*]* %154, i32 0, i64 %152, !dbg !84
  %156 = load float** %155, align 8, !dbg !84
  %157 = load i32* %k, align 4, !dbg !84
  %158 = sext i32 %157 to i64, !dbg !84
  %159 = getelementptr inbounds float* %156, i64 %158, !dbg !84
  %160 = load float* %159, align 4, !dbg !84
  store float %160, float* %t, align 4, !dbg !84
  br label %161, !dbg !85

; <label>:161                                     ; preds = %121, %107
  %162 = load i32* %k, align 4, !dbg !86
  %163 = add nsw i32 %162, 1, !dbg !86
  store i32 %163, i32* %i, align 4, !dbg !86
  %164 = load i32* %j, align 4, !dbg !86
  %165 = sext i32 %164 to i64, !dbg !86
  %166 = load %struct.FULL** %2, align 8, !dbg !86
  %167 = getelementptr inbounds %struct.FULL* %166, i32 0, i32 2, !dbg !86
  %168 = getelementptr inbounds [1000 x float*]* %167, i32 0, i64 %165, !dbg !86
  %169 = load float** %168, align 8, !dbg !86
  %170 = load i32* %k, align 4, !dbg !86
  %171 = sext i32 %170 to i64, !dbg !86
  %172 = getelementptr inbounds float* %169, i64 %171, !dbg !86
  %173 = getelementptr inbounds float* %172, i64 1, !dbg !86
  store float* %173, float** %aij, align 8, !dbg !86
  %174 = load float** %akk, align 8, !dbg !86
  %175 = getelementptr inbounds float* %174, i64 1, !dbg !86
  store float* %175, float** %mik, align 8, !dbg !86
  br label %176, !dbg !86

; <label>:176                                     ; preds = %188, %161
  %177 = load i32* %i, align 4, !dbg !86
  %178 = load i32* %n, align 4, !dbg !86
  %179 = icmp slt i32 %177, %178, !dbg !86
  br i1 %179, label %180, label %195, !dbg !86

; <label>:180                                     ; preds = %176
  %181 = load float* %t, align 4, !dbg !88
  %182 = load float** %mik, align 8, !dbg !88
  %183 = load float* %182, align 4, !dbg !88
  %184 = fmul float %181, %183, !dbg !88
  %185 = load float** %aij, align 8, !dbg !88
  %186 = load float* %185, align 4, !dbg !88
  %187 = fadd float %186, %184, !dbg !88
  store float %187, float* %185, align 4, !dbg !88
  br label %188, !dbg !88

; <label>:188                                     ; preds = %180
  %189 = load i32* %i, align 4, !dbg !86
  %190 = add nsw i32 %189, 1, !dbg !86
  store i32 %190, i32* %i, align 4, !dbg !86
  %191 = load float** %aij, align 8, !dbg !86
  %192 = getelementptr inbounds float* %191, i32 1, !dbg !86
  store float* %192, float** %aij, align 8, !dbg !86
  %193 = load float** %mik, align 8, !dbg !86
  %194 = getelementptr inbounds float* %193, i32 1, !dbg !86
  store float* %194, float** %mik, align 8, !dbg !86
  br label %176, !dbg !86

; <label>:195                                     ; preds = %176
  br label %196, !dbg !89

; <label>:196                                     ; preds = %195
  %197 = load i32* %j, align 4, !dbg !75
  %198 = add nsw i32 %197, 1, !dbg !75
  store i32 %198, i32* %j, align 4, !dbg !75
  br label %103, !dbg !75

; <label>:199                                     ; preds = %103
  br label %200, !dbg !90

; <label>:200                                     ; preds = %199, %62
  %201 = load i32* %k, align 4, !dbg !52
  %202 = add nsw i32 %201, 1, !dbg !52
  store i32 %202, i32* %k, align 4, !dbg !52
  %203 = load i32** %3, align 8, !dbg !52
  %204 = getelementptr inbounds i32* %203, i32 1, !dbg !52
  store i32* %204, i32** %3, align 8, !dbg !52
  br label %26, !dbg !52

; <label>:205                                     ; preds = %26
  br label %206, !dbg !91

; <label>:206                                     ; preds = %205, %24
  %207 = load i32* %nm1, align 4, !dbg !92
  %208 = load i32** %3, align 8, !dbg !92
  store i32 %207, i32* %208, align 4, !dbg !92
  %209 = load float** %akk, align 8, !dbg !93
  %210 = load float* %209, align 4, !dbg !93
  %211 = fpext float %210 to double, !dbg !93
  %212 = fcmp oeq double %211, 0.000000e+00, !dbg !93
  br i1 %212, label %213, label %215, !dbg !93

; <label>:213                                     ; preds = %206
  %214 = load i32* %n, align 4, !dbg !93
  store i32 %214, i32* %info, align 4, !dbg !93
  br label %215, !dbg !93

; <label>:215                                     ; preds = %213, %206
  %216 = load i32* %info, align 4, !dbg !95
  store i32 %216, i32* %1, !dbg !95
  br label %217, !dbg !95

; <label>:217                                     ; preds = %215, %11
  %218 = load i32* %1, !dbg !96
  ret i32 %218, !dbg !96
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare i32 @isamax(...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23}
!llvm.ident = !{!24}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c] [DW_LANG_C99]
!1 = metadata !{metadata !"sgefa.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa"}
!2 = metadata !{}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"sgefa", metadata !"sgefa", metadata !"", i32 11, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (%struct.FULL*, i32*)* @sgefa, null, null, metadata !2, i32 48} ; [ DW_TAG_subprogram ] [line 11] [def] [scope 48] [sgefa]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9, metadata !21}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FULL]
!10 = metadata !{i32 786451, metadata !11, null, metadata !"FULL", i32 31, i64 64064, i64 64, i32 0, i32 0, null, metadata !12, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [FULL] [line 31, size 64064, align 64, offset 0] [def] [from ]
!11 = metadata !{metadata !"./ge.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa"}
!12 = metadata !{metadata !13, metadata !14, metadata !15}
!13 = metadata !{i32 786445, metadata !11, metadata !10, metadata !"cd", i32 32, i64 32, i64 32, i64 0, i32 0, metadata !8} ; [ DW_TAG_member ] [cd] [line 32, size 32, align 32, offset 0] [from int]
!14 = metadata !{i32 786445, metadata !11, metadata !10, metadata !"rd", i32 33, i64 32, i64 32, i64 32, i32 0, metadata !8} ; [ DW_TAG_member ] [rd] [line 33, size 32, align 32, offset 32] [from int]
!15 = metadata !{i32 786445, metadata !11, metadata !10, metadata !"pd", i32 34, i64 64000, i64 64, i64 64, i32 0, metadata !16} ; [ DW_TAG_member ] [pd] [line 34, size 64000, align 64, offset 64] [from ]
!16 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 64000, i64 64, i32 0, i32 0, metadata !17, metadata !19, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64000, align 64, offset 0] [from ]
!17 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!18 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!19 = metadata !{metadata !20}
!20 = metadata !{i32 786465, i64 0, i64 1000}     ; [ DW_TAG_subrange_type ] [0, 999]
!21 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!22 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!23 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!24 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!25 = metadata !{i32 786689, metadata !4, metadata !"a", metadata !5, i32 16777228, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 12]
!26 = metadata !{i32 12, i32 0, metadata !4, null}
!27 = metadata !{i32 786689, metadata !4, metadata !"ipvt", metadata !5, i32 33554445, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ipvt] [line 13]
!28 = metadata !{i32 13, i32 0, metadata !4, null}
!29 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 49, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 49]
!30 = metadata !{i32 49, i32 0, metadata !4, null}
!31 = metadata !{i32 786688, metadata !4, metadata !"j", metadata !5, i32 49, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 49]
!32 = metadata !{i32 786688, metadata !4, metadata !"k", metadata !5, i32 50, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 50]
!33 = metadata !{i32 50, i32 0, metadata !4, null}
!34 = metadata !{i32 786688, metadata !4, metadata !"l", metadata !5, i32 50, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 50]
!35 = metadata !{i32 786688, metadata !4, metadata !"nm1", metadata !5, i32 50, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [nm1] [line 50]
!36 = metadata !{i32 786688, metadata !4, metadata !"info", metadata !5, i32 50, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [info] [line 50]
!37 = metadata !{i32 786688, metadata !4, metadata !"n", metadata !5, i32 50, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 50]
!38 = metadata !{i32 786688, metadata !4, metadata !"t", metadata !5, i32 51, metadata !18, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 51]
!39 = metadata !{i32 51, i32 0, metadata !4, null}
!40 = metadata !{i32 786688, metadata !4, metadata !"akk", metadata !5, i32 51, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [akk] [line 51]
!41 = metadata !{i32 786688, metadata !4, metadata !"alk", metadata !5, i32 51, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [alk] [line 51]
!42 = metadata !{i32 786688, metadata !4, metadata !"aij", metadata !5, i32 51, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [aij] [line 51]
!43 = metadata !{i32 786688, metadata !4, metadata !"mik", metadata !5, i32 51, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mik] [line 51]
!44 = metadata !{i32 54, i32 0, metadata !45, null}
!45 = metadata !{i32 786443, metadata !1, metadata !4, i32 54, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!46 = metadata !{i32 55, i32 0, metadata !4, null}
!47 = metadata !{i32 56, i32 0, metadata !4, null}
!48 = metadata !{i32 57, i32 0, metadata !4, null}
!49 = metadata !{i32 58, i32 0, metadata !4, null} ; [ DW_TAG_imported_module ]
!50 = metadata !{i32 59, i32 0, metadata !51, null}
!51 = metadata !{i32 786443, metadata !1, metadata !4, i32 59, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!52 = metadata !{i32 62, i32 0, metadata !53, null}
!53 = metadata !{i32 786443, metadata !1, metadata !4, i32 62, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!54 = metadata !{i32 65, i32 0, metadata !55, null}
!55 = metadata !{i32 786443, metadata !1, metadata !53, i32 62, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!56 = metadata !{i32 66, i32 0, metadata !55, null}
!57 = metadata !{i32 67, i32 0, metadata !55, null}
!58 = metadata !{i32 70, i32 0, metadata !55, null}
!59 = metadata !{i32 71, i32 0, metadata !60, null}
!60 = metadata !{i32 786443, metadata !1, metadata !55, i32 71, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!61 = metadata !{i32 72, i32 0, metadata !62, null}
!62 = metadata !{i32 786443, metadata !1, metadata !60, i32 71, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!63 = metadata !{i32 73, i32 0, metadata !62, null}
!64 = metadata !{i32 77, i32 0, metadata !65, null}
!65 = metadata !{i32 786443, metadata !1, metadata !55, i32 77, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!66 = metadata !{i32 78, i32 0, metadata !67, null}
!67 = metadata !{i32 786443, metadata !1, metadata !65, i32 77, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!68 = metadata !{i32 79, i32 0, metadata !67, null}
!69 = metadata !{i32 80, i32 0, metadata !67, null}
!70 = metadata !{i32 81, i32 0, metadata !67, null}
!71 = metadata !{i32 84, i32 0, metadata !55, null}
!72 = metadata !{i32 85, i32 0, metadata !73, null}
!73 = metadata !{i32 786443, metadata !1, metadata !55, i32 85, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!74 = metadata !{i32 86, i32 0, metadata !73, null}
!75 = metadata !{i32 89, i32 0, metadata !76, null}
!76 = metadata !{i32 786443, metadata !1, metadata !55, i32 89, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!77 = metadata !{i32 92, i32 0, metadata !78, null}
!78 = metadata !{i32 786443, metadata !1, metadata !76, i32 89, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!79 = metadata !{i32 93, i32 0, metadata !80, null}
!80 = metadata !{i32 786443, metadata !1, metadata !78, i32 93, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!81 = metadata !{i32 94, i32 0, metadata !82, null}
!82 = metadata !{i32 786443, metadata !1, metadata !80, i32 93, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!83 = metadata !{i32 95, i32 0, metadata !82, null}
!84 = metadata !{i32 96, i32 0, metadata !82, null}
!85 = metadata !{i32 97, i32 0, metadata !82, null}
!86 = metadata !{i32 98, i32 0, metadata !87, null}
!87 = metadata !{i32 786443, metadata !1, metadata !78, i32 98, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!88 = metadata !{i32 99, i32 0, metadata !87, null}
!89 = metadata !{i32 100, i32 0, metadata !78, null}
!90 = metadata !{i32 101, i32 0, metadata !55, null}
!91 = metadata !{i32 101, i32 0, metadata !53, null}
!92 = metadata !{i32 104, i32 0, metadata !4, null}
!93 = metadata !{i32 105, i32 0, metadata !94, null}
!94 = metadata !{i32 786443, metadata !1, metadata !4, i32 105, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!95 = metadata !{i32 106, i32 0, metadata !4, null}
!96 = metadata !{i32 107, i32 0, metadata !4, null}
