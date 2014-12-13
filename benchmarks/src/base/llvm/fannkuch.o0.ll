; ModuleID = 'fannkuch.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"Pfannkuchen(%d) = %ld\0A\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %n = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !19), !dbg !20
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !21), !dbg !20
  call void @llvm.dbg.declare(metadata !{i32* %n}, metadata !22), !dbg !23
  store i32 11, i32* %n, align 4, !dbg !23
  %4 = load i32* %n, align 4, !dbg !24
  %5 = load i32* %n, align 4, !dbg !24
  %6 = call i64 @fannkuch(i32 %5), !dbg !24
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i32 0, i32 0), i32 %4, i64 %6), !dbg !24
  ret i32 0, !dbg !25
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define internal i64 @fannkuch(i32 %n) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i32, align 4
  %perm = alloca i32*, align 8
  %perm1 = alloca i32*, align 8
  %count = alloca i32*, align 8
  %flips = alloca i64, align 8
  %flipsMax = alloca i64, align 8
  %r = alloca i32, align 4
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %didpr = alloca i32, align 4
  %n1 = alloca i32, align 4
  %j = alloca i32, align 4
  %t_mp = alloca i32, align 4
  %perm0 = alloca i32, align 4
  store i32 %n, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !26), !dbg !27
  call void @llvm.dbg.declare(metadata !{i32** %perm}, metadata !28), !dbg !30
  call void @llvm.dbg.declare(metadata !{i32** %perm1}, metadata !31), !dbg !32
  call void @llvm.dbg.declare(metadata !{i32** %count}, metadata !33), !dbg !34
  call void @llvm.dbg.declare(metadata !{i64* %flips}, metadata !35), !dbg !36
  call void @llvm.dbg.declare(metadata !{i64* %flipsMax}, metadata !37), !dbg !38
  call void @llvm.dbg.declare(metadata !{i32* %r}, metadata !39), !dbg !40
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !41), !dbg !42
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !43), !dbg !44
  call void @llvm.dbg.declare(metadata !{i32* %didpr}, metadata !45), !dbg !46
  call void @llvm.dbg.declare(metadata !{i32* %n1}, metadata !47), !dbg !49
  %3 = load i32* %2, align 4, !dbg !49
  %4 = sub nsw i32 %3, 1, !dbg !49
  store i32 %4, i32* %n1, align 4, !dbg !49
  %5 = load i32* %2, align 4, !dbg !50
  %6 = icmp slt i32 %5, 1, !dbg !50
  br i1 %6, label %7, label %8, !dbg !50

; <label>:7                                       ; preds = %0
  store i64 0, i64* %1, !dbg !50
  br label %210, !dbg !50

; <label>:8                                       ; preds = %0
  %9 = load i32* %2, align 4, !dbg !52
  %10 = sext i32 %9 to i64, !dbg !52
  %11 = call noalias i8* @calloc(i64 %10, i64 4) #4, !dbg !52
  %12 = bitcast i8* %11 to i32*, !dbg !52
  store i32* %12, i32** %perm, align 8, !dbg !52
  %13 = load i32* %2, align 4, !dbg !53
  %14 = sext i32 %13 to i64, !dbg !53
  %15 = call noalias i8* @calloc(i64 %14, i64 4) #4, !dbg !53
  %16 = bitcast i8* %15 to i32*, !dbg !53
  store i32* %16, i32** %perm1, align 8, !dbg !53
  %17 = load i32* %2, align 4, !dbg !54
  %18 = sext i32 %17 to i64, !dbg !54
  %19 = call noalias i8* @calloc(i64 %18, i64 4) #4, !dbg !54
  %20 = bitcast i8* %19 to i32*, !dbg !54
  store i32* %20, i32** %count, align 8, !dbg !54
  store i32 0, i32* %i, align 4, !dbg !55
  br label %21, !dbg !55

; <label>:21                                      ; preds = %31, %8
  %22 = load i32* %i, align 4, !dbg !55
  %23 = load i32* %2, align 4, !dbg !55
  %24 = icmp slt i32 %22, %23, !dbg !55
  br i1 %24, label %25, label %34, !dbg !55

; <label>:25                                      ; preds = %21
  %26 = load i32* %i, align 4, !dbg !55
  %27 = load i32* %i, align 4, !dbg !55
  %28 = sext i32 %27 to i64, !dbg !55
  %29 = load i32** %perm1, align 8, !dbg !55
  %30 = getelementptr inbounds i32* %29, i64 %28, !dbg !55
  store i32 %26, i32* %30, align 4, !dbg !55
  br label %31, !dbg !55

; <label>:31                                      ; preds = %25
  %32 = load i32* %i, align 4, !dbg !55
  %33 = add nsw i32 %32, 1, !dbg !55
  store i32 %33, i32* %i, align 4, !dbg !55
  br label %21, !dbg !55

; <label>:34                                      ; preds = %21
  %35 = load i32* %2, align 4, !dbg !57
  store i32 %35, i32* %r, align 4, !dbg !57
  store i32 0, i32* %didpr, align 4, !dbg !57
  store i64 0, i64* %flipsMax, align 8, !dbg !57
  br label %36, !dbg !58

; <label>:36                                      ; preds = %209, %34
  %37 = load i32* %didpr, align 4, !dbg !60
  %38 = icmp slt i32 %37, 30, !dbg !60
  br i1 %38, label %39, label %59, !dbg !60

; <label>:39                                      ; preds = %36
  store i32 0, i32* %i, align 4, !dbg !63
  br label %40, !dbg !63

; <label>:40                                      ; preds = %52, %39
  %41 = load i32* %i, align 4, !dbg !63
  %42 = load i32* %2, align 4, !dbg !63
  %43 = icmp slt i32 %41, %42, !dbg !63
  br i1 %43, label %44, label %55, !dbg !63

; <label>:44                                      ; preds = %40
  %45 = load i32* %i, align 4, !dbg !63
  %46 = sext i32 %45 to i64, !dbg !63
  %47 = load i32** %perm1, align 8, !dbg !63
  %48 = getelementptr inbounds i32* %47, i64 %46, !dbg !63
  %49 = load i32* %48, align 4, !dbg !63
  %50 = add nsw i32 1, %49, !dbg !63
  %51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i32 %50), !dbg !63
  br label %52, !dbg !63

; <label>:52                                      ; preds = %44
  %53 = load i32* %i, align 4, !dbg !63
  %54 = add nsw i32 %53, 1, !dbg !63
  store i32 %54, i32* %i, align 4, !dbg !63
  br label %40, !dbg !63

; <label>:55                                      ; preds = %40
  %56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !66
  %57 = load i32* %didpr, align 4, !dbg !67
  %58 = add nsw i32 %57, 1, !dbg !67
  store i32 %58, i32* %didpr, align 4, !dbg !67
  br label %59, !dbg !68

; <label>:59                                      ; preds = %55, %36
  br label %60, !dbg !69

; <label>:60                                      ; preds = %70, %59
  %61 = load i32* %r, align 4, !dbg !69
  %62 = icmp ne i32 %61, 1, !dbg !69
  br i1 %62, label %63, label %73, !dbg !69

; <label>:63                                      ; preds = %60
  %64 = load i32* %r, align 4, !dbg !71
  %65 = load i32* %r, align 4, !dbg !71
  %66 = sub nsw i32 %65, 1, !dbg !71
  %67 = sext i32 %66 to i64, !dbg !71
  %68 = load i32** %count, align 8, !dbg !71
  %69 = getelementptr inbounds i32* %68, i64 %67, !dbg !71
  store i32 %64, i32* %69, align 4, !dbg !71
  br label %70, !dbg !73

; <label>:70                                      ; preds = %63
  %71 = load i32* %r, align 4, !dbg !69
  %72 = add nsw i32 %71, -1, !dbg !69
  store i32 %72, i32* %r, align 4, !dbg !69
  br label %60, !dbg !69

; <label>:73                                      ; preds = %60
  %74 = load i32** %perm1, align 8, !dbg !74
  %75 = getelementptr inbounds i32* %74, i64 0, !dbg !74
  %76 = load i32* %75, align 4, !dbg !74
  %77 = icmp eq i32 %76, 0, !dbg !74
  br i1 %77, label %164, label %78, !dbg !74

; <label>:78                                      ; preds = %73
  %79 = load i32* %n1, align 4, !dbg !74
  %80 = sext i32 %79 to i64, !dbg !74
  %81 = load i32** %perm1, align 8, !dbg !74
  %82 = getelementptr inbounds i32* %81, i64 %80, !dbg !74
  %83 = load i32* %82, align 4, !dbg !74
  %84 = load i32* %n1, align 4, !dbg !74
  %85 = icmp eq i32 %83, %84, !dbg !74
  br i1 %85, label %164, label %86, !dbg !74

; <label>:86                                      ; preds = %78
  store i64 0, i64* %flips, align 8, !dbg !76
  store i32 1, i32* %i, align 4, !dbg !78
  br label %87, !dbg !78

; <label>:87                                      ; preds = %101, %86
  %88 = load i32* %i, align 4, !dbg !78
  %89 = load i32* %2, align 4, !dbg !78
  %90 = icmp slt i32 %88, %89, !dbg !78
  br i1 %90, label %91, label %104, !dbg !78

; <label>:91                                      ; preds = %87
  %92 = load i32* %i, align 4, !dbg !80
  %93 = sext i32 %92 to i64, !dbg !80
  %94 = load i32** %perm1, align 8, !dbg !80
  %95 = getelementptr inbounds i32* %94, i64 %93, !dbg !80
  %96 = load i32* %95, align 4, !dbg !80
  %97 = load i32* %i, align 4, !dbg !80
  %98 = sext i32 %97 to i64, !dbg !80
  %99 = load i32** %perm, align 8, !dbg !80
  %100 = getelementptr inbounds i32* %99, i64 %98, !dbg !80
  store i32 %96, i32* %100, align 4, !dbg !80
  br label %101, !dbg !82

; <label>:101                                     ; preds = %91
  %102 = load i32* %i, align 4, !dbg !78
  %103 = add nsw i32 %102, 1, !dbg !78
  store i32 %103, i32* %i, align 4, !dbg !78
  br label %87, !dbg !78

; <label>:104                                     ; preds = %87
  %105 = load i32** %perm1, align 8, !dbg !83
  %106 = getelementptr inbounds i32* %105, i64 0, !dbg !83
  %107 = load i32* %106, align 4, !dbg !83
  store i32 %107, i32* %k, align 4, !dbg !83
  br label %108, !dbg !84

; <label>:108                                     ; preds = %154, %104
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !85), !dbg !87
  store i32 1, i32* %i, align 4, !dbg !88
  %109 = load i32* %k, align 4, !dbg !88
  %110 = sub nsw i32 %109, 1, !dbg !88
  store i32 %110, i32* %j, align 4, !dbg !88
  br label %111, !dbg !88

; <label>:111                                     ; preds = %135, %108
  %112 = load i32* %i, align 4, !dbg !88
  %113 = load i32* %j, align 4, !dbg !88
  %114 = icmp slt i32 %112, %113, !dbg !88
  br i1 %114, label %115, label %140, !dbg !88

; <label>:115                                     ; preds = %111
  call void @llvm.dbg.declare(metadata !{i32* %t_mp}, metadata !90), !dbg !93
  %116 = load i32* %i, align 4, !dbg !93
  %117 = sext i32 %116 to i64, !dbg !93
  %118 = load i32** %perm, align 8, !dbg !93
  %119 = getelementptr inbounds i32* %118, i64 %117, !dbg !93
  %120 = load i32* %119, align 4, !dbg !93
  store i32 %120, i32* %t_mp, align 4, !dbg !93
  %121 = load i32* %j, align 4, !dbg !93
  %122 = sext i32 %121 to i64, !dbg !93
  %123 = load i32** %perm, align 8, !dbg !93
  %124 = getelementptr inbounds i32* %123, i64 %122, !dbg !93
  %125 = load i32* %124, align 4, !dbg !93
  %126 = load i32* %i, align 4, !dbg !93
  %127 = sext i32 %126 to i64, !dbg !93
  %128 = load i32** %perm, align 8, !dbg !93
  %129 = getelementptr inbounds i32* %128, i64 %127, !dbg !93
  store i32 %125, i32* %129, align 4, !dbg !93
  %130 = load i32* %t_mp, align 4, !dbg !93
  %131 = load i32* %j, align 4, !dbg !93
  %132 = sext i32 %131 to i64, !dbg !93
  %133 = load i32** %perm, align 8, !dbg !93
  %134 = getelementptr inbounds i32* %133, i64 %132, !dbg !93
  store i32 %130, i32* %134, align 4, !dbg !93
  br label %135, !dbg !94

; <label>:135                                     ; preds = %115
  %136 = load i32* %i, align 4, !dbg !88
  %137 = add nsw i32 %136, 1, !dbg !88
  store i32 %137, i32* %i, align 4, !dbg !88
  %138 = load i32* %j, align 4, !dbg !88
  %139 = add nsw i32 %138, -1, !dbg !88
  store i32 %139, i32* %j, align 4, !dbg !88
  br label %111, !dbg !88

; <label>:140                                     ; preds = %111
  %141 = load i64* %flips, align 8, !dbg !95
  %142 = add nsw i64 %141, 1, !dbg !95
  store i64 %142, i64* %flips, align 8, !dbg !95
  %143 = load i32* %k, align 4, !dbg !96
  %144 = sext i32 %143 to i64, !dbg !96
  %145 = load i32** %perm, align 8, !dbg !96
  %146 = getelementptr inbounds i32* %145, i64 %144, !dbg !96
  %147 = load i32* %146, align 4, !dbg !96
  store i32 %147, i32* %j, align 4, !dbg !96
  %148 = load i32* %k, align 4, !dbg !96
  %149 = load i32* %k, align 4, !dbg !96
  %150 = sext i32 %149 to i64, !dbg !96
  %151 = load i32** %perm, align 8, !dbg !96
  %152 = getelementptr inbounds i32* %151, i64 %150, !dbg !96
  store i32 %148, i32* %152, align 4, !dbg !96
  %153 = load i32* %j, align 4, !dbg !96
  store i32 %153, i32* %k, align 4, !dbg !96
  br label %154, !dbg !97

; <label>:154                                     ; preds = %140
  %155 = load i32* %k, align 4, !dbg !97
  %156 = icmp ne i32 %155, 0, !dbg !97
  br i1 %156, label %108, label %157, !dbg !97

; <label>:157                                     ; preds = %154
  %158 = load i64* %flipsMax, align 8, !dbg !98
  %159 = load i64* %flips, align 8, !dbg !98
  %160 = icmp slt i64 %158, %159, !dbg !98
  br i1 %160, label %161, label %163, !dbg !98

; <label>:161                                     ; preds = %157
  %162 = load i64* %flips, align 8, !dbg !100
  store i64 %162, i64* %flipsMax, align 8, !dbg !100
  br label %163, !dbg !102

; <label>:163                                     ; preds = %161, %157
  br label %164, !dbg !103

; <label>:164                                     ; preds = %163, %78, %73
  br label %165, !dbg !104

; <label>:165                                     ; preds = %206, %164
  %166 = load i32* %r, align 4, !dbg !106
  %167 = load i32* %2, align 4, !dbg !106
  %168 = icmp eq i32 %166, %167, !dbg !106
  br i1 %168, label %169, label %171, !dbg !106

; <label>:169                                     ; preds = %165
  %170 = load i64* %flipsMax, align 8, !dbg !109
  store i64 %170, i64* %1, !dbg !109
  br label %210, !dbg !109

; <label>:171                                     ; preds = %165
  call void @llvm.dbg.declare(metadata !{i32* %perm0}, metadata !111), !dbg !113
  %172 = load i32** %perm1, align 8, !dbg !113
  %173 = getelementptr inbounds i32* %172, i64 0, !dbg !113
  %174 = load i32* %173, align 4, !dbg !113
  store i32 %174, i32* %perm0, align 4, !dbg !113
  store i32 0, i32* %i, align 4, !dbg !114
  br label %175, !dbg !115

; <label>:175                                     ; preds = %179, %171
  %176 = load i32* %i, align 4, !dbg !115
  %177 = load i32* %r, align 4, !dbg !115
  %178 = icmp slt i32 %176, %177, !dbg !115
  br i1 %178, label %179, label %192, !dbg !115

; <label>:179                                     ; preds = %175
  %180 = load i32* %i, align 4, !dbg !116
  %181 = add nsw i32 %180, 1, !dbg !116
  store i32 %181, i32* %k, align 4, !dbg !116
  %182 = load i32* %k, align 4, !dbg !118
  %183 = sext i32 %182 to i64, !dbg !118
  %184 = load i32** %perm1, align 8, !dbg !118
  %185 = getelementptr inbounds i32* %184, i64 %183, !dbg !118
  %186 = load i32* %185, align 4, !dbg !118
  %187 = load i32* %i, align 4, !dbg !118
  %188 = sext i32 %187 to i64, !dbg !118
  %189 = load i32** %perm1, align 8, !dbg !118
  %190 = getelementptr inbounds i32* %189, i64 %188, !dbg !118
  store i32 %186, i32* %190, align 4, !dbg !118
  %191 = load i32* %k, align 4, !dbg !119
  store i32 %191, i32* %i, align 4, !dbg !119
  br label %175, !dbg !120

; <label>:192                                     ; preds = %175
  %193 = load i32* %perm0, align 4, !dbg !121
  %194 = load i32* %r, align 4, !dbg !121
  %195 = sext i32 %194 to i64, !dbg !121
  %196 = load i32** %perm1, align 8, !dbg !121
  %197 = getelementptr inbounds i32* %196, i64 %195, !dbg !121
  store i32 %193, i32* %197, align 4, !dbg !121
  %198 = load i32* %r, align 4, !dbg !122
  %199 = sext i32 %198 to i64, !dbg !122
  %200 = load i32** %count, align 8, !dbg !122
  %201 = getelementptr inbounds i32* %200, i64 %199, !dbg !122
  %202 = load i32* %201, align 4, !dbg !122
  %203 = sub nsw i32 %202, 1, !dbg !122
  store i32 %203, i32* %201, align 4, !dbg !122
  %204 = icmp sgt i32 %203, 0, !dbg !122
  br i1 %204, label %205, label %206, !dbg !122

; <label>:205                                     ; preds = %192
  br label %209, !dbg !124

; <label>:206                                     ; preds = %192
  %207 = load i32* %r, align 4, !dbg !126
  %208 = add nsw i32 %207, 1, !dbg !126
  store i32 %208, i32* %r, align 4, !dbg !126
  br label %165, !dbg !127

; <label>:209                                     ; preds = %205
  br label %36, !dbg !128

; <label>:210                                     ; preds = %169, %7
  %211 = load i64* %1, !dbg !129
  ret i64 %211, !dbg !129
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!16, !17}
!llvm.ident = !{!18}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c] [DW_LANG_C99]
!1 = metadata !{metadata !"fannkuch.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !12}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 99, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 100} ; [ DW_TAG_subprogram ] [line 99] [def] [scope 100] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"fannkuch", metadata !"fannkuch", metadata !"", i32 18, metadata !13, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i32)* @fannkuch, null, null, metadata !2, i32 19} ; [ DW_TAG_subprogram ] [line 18] [local] [def] [scope 19] [fannkuch]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !15, metadata !8}
!15 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!16 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!17 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!18 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!19 = metadata !{i32 786689, metadata !4, metadata !"argc", metadata !5, i32 16777315, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 99]
!20 = metadata !{i32 99, i32 0, metadata !4, null}
!21 = metadata !{i32 786689, metadata !4, metadata !"argv", metadata !5, i32 33554531, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 99]
!22 = metadata !{i32 786688, metadata !4, metadata !"n", metadata !5, i32 101, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 101]
!23 = metadata !{i32 101, i32 0, metadata !4, null}
!24 = metadata !{i32 103, i32 0, metadata !4, null}
!25 = metadata !{i32 104, i32 0, metadata !4, null}
!26 = metadata !{i32 786689, metadata !12, metadata !"n", metadata !5, i32 16777234, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 18]
!27 = metadata !{i32 18, i32 0, metadata !12, null}
!28 = metadata !{i32 786688, metadata !12, metadata !"perm", metadata !5, i32 20, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [perm] [line 20]
!29 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!30 = metadata !{i32 20, i32 0, metadata !12, null}
!31 = metadata !{i32 786688, metadata !12, metadata !"perm1", metadata !5, i32 21, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [perm1] [line 21]
!32 = metadata !{i32 21, i32 0, metadata !12, null}
!33 = metadata !{i32 786688, metadata !12, metadata !"count", metadata !5, i32 22, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 22]
!34 = metadata !{i32 22, i32 0, metadata !12, null}
!35 = metadata !{i32 786688, metadata !12, metadata !"flips", metadata !5, i32 23, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [flips] [line 23]
!36 = metadata !{i32 23, i32 0, metadata !12, null}
!37 = metadata !{i32 786688, metadata !12, metadata !"flipsMax", metadata !5, i32 24, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [flipsMax] [line 24]
!38 = metadata !{i32 24, i32 0, metadata !12, null}
!39 = metadata !{i32 786688, metadata !12, metadata !"r", metadata !5, i32 25, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 25]
!40 = metadata !{i32 25, i32 0, metadata !12, null}
!41 = metadata !{i32 786688, metadata !12, metadata !"i", metadata !5, i32 26, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 26]
!42 = metadata !{i32 26, i32 0, metadata !12, null}
!43 = metadata !{i32 786688, metadata !12, metadata !"k", metadata !5, i32 27, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 27]
!44 = metadata !{i32 27, i32 0, metadata !12, null}
!45 = metadata !{i32 786688, metadata !12, metadata !"didpr", metadata !5, i32 28, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [didpr] [line 28]
!46 = metadata !{i32 28, i32 0, metadata !12, null}
!47 = metadata !{i32 786688, metadata !12, metadata !"n1", metadata !5, i32 29, metadata !48, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n1] [line 29]
!48 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!49 = metadata !{i32 29, i32 0, metadata !12, null}
!50 = metadata !{i32 31, i32 0, metadata !51, null}
!51 = metadata !{i32 786443, metadata !1, metadata !12, i32 31, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!52 = metadata !{i32 33, i32 0, metadata !12, null}
!53 = metadata !{i32 34, i32 0, metadata !12, null}
!54 = metadata !{i32 35, i32 0, metadata !12, null}
!55 = metadata !{i32 37, i32 0, metadata !56, null}
!56 = metadata !{i32 786443, metadata !1, metadata !12, i32 37, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!57 = metadata !{i32 39, i32 0, metadata !12, null}
!58 = metadata !{i32 40, i32 0, metadata !59, null}
!59 = metadata !{i32 786443, metadata !1, metadata !12, i32 40, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!60 = metadata !{i32 41, i32 0, metadata !61, null}
!61 = metadata !{i32 786443, metadata !1, metadata !62, i32 41, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!62 = metadata !{i32 786443, metadata !1, metadata !59, i32 40, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!63 = metadata !{i32 42, i32 0, metadata !64, null}
!64 = metadata !{i32 786443, metadata !1, metadata !65, i32 42, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!65 = metadata !{i32 786443, metadata !1, metadata !61, i32 41, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!66 = metadata !{i32 43, i32 0, metadata !65, null}
!67 = metadata !{i32 44, i32 0, metadata !65, null}
!68 = metadata !{i32 45, i32 0, metadata !65, null}
!69 = metadata !{i32 46, i32 0, metadata !70, null}
!70 = metadata !{i32 786443, metadata !1, metadata !62, i32 46, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!71 = metadata !{i32 47, i32 0, metadata !72, null}
!72 = metadata !{i32 786443, metadata !1, metadata !70, i32 46, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!73 = metadata !{i32 48, i32 0, metadata !72, null}
!74 = metadata !{i32 52, i32 0, metadata !75, null}
!75 = metadata !{i32 786443, metadata !1, metadata !62, i32 52, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!76 = metadata !{i32 53, i32 0, metadata !77, null}
!77 = metadata !{i32 786443, metadata !1, metadata !75, i32 52, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!78 = metadata !{i32 54, i32 0, metadata !79, null}
!79 = metadata !{i32 786443, metadata !1, metadata !77, i32 54, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!80 = metadata !{i32 55, i32 0, metadata !81, null}
!81 = metadata !{i32 786443, metadata !1, metadata !79, i32 54, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!82 = metadata !{i32 56, i32 0, metadata !81, null}
!83 = metadata !{i32 57, i32 0, metadata !77, null}
!84 = metadata !{i32 58, i32 0, metadata !77, null} ; [ DW_TAG_imported_module ]
!85 = metadata !{i32 786688, metadata !86, metadata !"j", metadata !5, i32 59, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 59]
!86 = metadata !{i32 786443, metadata !1, metadata !77, i32 58, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!87 = metadata !{i32 59, i32 0, metadata !86, null}
!88 = metadata !{i32 60, i32 0, metadata !89, null}
!89 = metadata !{i32 786443, metadata !1, metadata !86, i32 60, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!90 = metadata !{i32 786688, metadata !91, metadata !"t_mp", metadata !5, i32 61, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_mp] [line 61]
!91 = metadata !{i32 786443, metadata !1, metadata !92, i32 61, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!92 = metadata !{i32 786443, metadata !1, metadata !89, i32 60, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!93 = metadata !{i32 61, i32 0, metadata !91, null}
!94 = metadata !{i32 62, i32 0, metadata !92, null}
!95 = metadata !{i32 63, i32 0, metadata !86, null}
!96 = metadata !{i32 68, i32 0, metadata !86, null}
!97 = metadata !{i32 69, i32 0, metadata !86, null}
!98 = metadata !{i32 70, i32 0, metadata !99, null}
!99 = metadata !{i32 786443, metadata !1, metadata !77, i32 70, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!100 = metadata !{i32 71, i32 0, metadata !101, null}
!101 = metadata !{i32 786443, metadata !1, metadata !99, i32 70, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!102 = metadata !{i32 72, i32 0, metadata !101, null}
!103 = metadata !{i32 73, i32 0, metadata !77, null}
!104 = metadata !{i32 75, i32 0, metadata !105, null}
!105 = metadata !{i32 786443, metadata !1, metadata !62, i32 75, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!106 = metadata !{i32 76, i32 0, metadata !107, null}
!107 = metadata !{i32 786443, metadata !1, metadata !108, i32 76, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!108 = metadata !{i32 786443, metadata !1, metadata !105, i32 75, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!109 = metadata !{i32 77, i32 0, metadata !110, null}
!110 = metadata !{i32 786443, metadata !1, metadata !107, i32 76, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!111 = metadata !{i32 786688, metadata !112, metadata !"perm0", metadata !5, i32 81, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [perm0] [line 81]
!112 = metadata !{i32 786443, metadata !1, metadata !108, i32 80, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!113 = metadata !{i32 81, i32 0, metadata !112, null}
!114 = metadata !{i32 82, i32 0, metadata !112, null}
!115 = metadata !{i32 83, i32 0, metadata !112, null}
!116 = metadata !{i32 84, i32 0, metadata !117, null}
!117 = metadata !{i32 786443, metadata !1, metadata !112, i32 83, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!118 = metadata !{i32 85, i32 0, metadata !117, null}
!119 = metadata !{i32 86, i32 0, metadata !117, null}
!120 = metadata !{i32 87, i32 0, metadata !117, null}
!121 = metadata !{i32 88, i32 0, metadata !112, null}
!122 = metadata !{i32 90, i32 0, metadata !123, null}
!123 = metadata !{i32 786443, metadata !1, metadata !108, i32 90, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!124 = metadata !{i32 91, i32 0, metadata !125, null}
!125 = metadata !{i32 786443, metadata !1, metadata !123, i32 90, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!126 = metadata !{i32 93, i32 0, metadata !108, null}
!127 = metadata !{i32 94, i32 0, metadata !108, null}
!128 = metadata !{i32 95, i32 0, metadata !62, null}
!129 = metadata !{i32 96, i32 0, metadata !12, null}
