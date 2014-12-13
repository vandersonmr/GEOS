; ModuleID = 'whetstone.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [3 x i8] c"-c\00", align 1
@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [28 x i8] c"usage: whetdc [-c] [loops]\0A\00", align 1
@T = common global double 0.000000e+00, align 8
@T1 = common global double 0.000000e+00, align 8
@T2 = common global double 0.000000e+00, align 8
@E1 = common global [5 x double] zeroinitializer, align 16
@J = common global i32 0, align 4
@K = common global i32 0, align 4
@L = common global i32 0, align 4
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str3 = private unnamed_addr constant [44 x i8] c"%7ld %7ld %7ld %12.4e %12.4e %12.4e %12.4e\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %I = alloca i64, align 8
  %N1 = alloca i64, align 8
  %N2 = alloca i64, align 8
  %N3 = alloca i64, align 8
  %N4 = alloca i64, align 8
  %N6 = alloca i64, align 8
  %N7 = alloca i64, align 8
  %N8 = alloca i64, align 8
  %N9 = alloca i64, align 8
  %N10 = alloca i64, align 8
  %N11 = alloca i64, align 8
  %X1 = alloca double, align 8
  %X2 = alloca double, align 8
  %X3 = alloca double, align 8
  %X4 = alloca double, align 8
  %X = alloca double, align 8
  %Y = alloca double, align 8
  %Z = alloca double, align 8
  %LOOP = alloca i64, align 8
  %II = alloca i32, align 4
  %JJ = alloca i32, align 4
  %loopstart = alloca i64, align 8
  %startsec = alloca i64, align 8
  %finisec = alloca i64, align 8
  %KIPS = alloca float, align 4
  %continuous = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !41), !dbg !42
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !43), !dbg !42
  call void @llvm.dbg.declare(metadata !{i64* %I}, metadata !44), !dbg !45
  call void @llvm.dbg.declare(metadata !{i64* %N1}, metadata !46), !dbg !47
  call void @llvm.dbg.declare(metadata !{i64* %N2}, metadata !48), !dbg !47
  call void @llvm.dbg.declare(metadata !{i64* %N3}, metadata !49), !dbg !47
  call void @llvm.dbg.declare(metadata !{i64* %N4}, metadata !50), !dbg !47
  call void @llvm.dbg.declare(metadata !{i64* %N6}, metadata !51), !dbg !47
  call void @llvm.dbg.declare(metadata !{i64* %N7}, metadata !52), !dbg !47
  call void @llvm.dbg.declare(metadata !{i64* %N8}, metadata !53), !dbg !47
  call void @llvm.dbg.declare(metadata !{i64* %N9}, metadata !54), !dbg !47
  call void @llvm.dbg.declare(metadata !{i64* %N10}, metadata !55), !dbg !47
  call void @llvm.dbg.declare(metadata !{i64* %N11}, metadata !56), !dbg !47
  call void @llvm.dbg.declare(metadata !{double* %X1}, metadata !57), !dbg !58
  call void @llvm.dbg.declare(metadata !{double* %X2}, metadata !59), !dbg !58
  call void @llvm.dbg.declare(metadata !{double* %X3}, metadata !60), !dbg !58
  call void @llvm.dbg.declare(metadata !{double* %X4}, metadata !61), !dbg !58
  call void @llvm.dbg.declare(metadata !{double* %X}, metadata !62), !dbg !58
  call void @llvm.dbg.declare(metadata !{double* %Y}, metadata !63), !dbg !58
  call void @llvm.dbg.declare(metadata !{double* %Z}, metadata !64), !dbg !58
  call void @llvm.dbg.declare(metadata !{i64* %LOOP}, metadata !65), !dbg !66
  call void @llvm.dbg.declare(metadata !{i32* %II}, metadata !67), !dbg !68
  call void @llvm.dbg.declare(metadata !{i32* %JJ}, metadata !69), !dbg !68
  call void @llvm.dbg.declare(metadata !{i64* %loopstart}, metadata !70), !dbg !71
  call void @llvm.dbg.declare(metadata !{i64* %startsec}, metadata !72), !dbg !73
  call void @llvm.dbg.declare(metadata !{i64* %finisec}, metadata !74), !dbg !73
  call void @llvm.dbg.declare(metadata !{float* %KIPS}, metadata !75), !dbg !77
  call void @llvm.dbg.declare(metadata !{i32* %continuous}, metadata !78), !dbg !79
  store i64 100000, i64* %loopstart, align 8, !dbg !80
  store i32 0, i32* %continuous, align 4, !dbg !81
  store i32 1, i32* %II, align 4, !dbg !82
  br label %4, !dbg !83

; <label>:4                                       ; preds = %46, %0
  %5 = load i32* %II, align 4, !dbg !83
  %6 = load i32* %2, align 4, !dbg !83
  %7 = icmp slt i32 %5, %6, !dbg !83
  br i1 %7, label %8, label %49, !dbg !83

; <label>:8                                       ; preds = %4
  %9 = load i32* %II, align 4, !dbg !84
  %10 = sext i32 %9 to i64, !dbg !84
  %11 = load i8*** %3, align 8, !dbg !84
  %12 = getelementptr inbounds i8** %11, i64 %10, !dbg !84
  %13 = load i8** %12, align 8, !dbg !84
  %14 = call i32 @strncmp(i8* %13, i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i64 2) #5, !dbg !84
  %15 = icmp eq i32 %14, 0, !dbg !84
  br i1 %15, label %26, label %16, !dbg !84

; <label>:16                                      ; preds = %8
  %17 = load i32* %II, align 4, !dbg !84
  %18 = sext i32 %17 to i64, !dbg !84
  %19 = load i8*** %3, align 8, !dbg !84
  %20 = getelementptr inbounds i8** %19, i64 %18, !dbg !84
  %21 = load i8** %20, align 8, !dbg !84
  %22 = getelementptr inbounds i8* %21, i64 0, !dbg !84
  %23 = load i8* %22, align 1, !dbg !84
  %24 = sext i8 %23 to i32, !dbg !84
  %25 = icmp eq i32 %24, 99, !dbg !84
  br i1 %25, label %26, label %27, !dbg !84

; <label>:26                                      ; preds = %16, %8
  store i32 1, i32* %continuous, align 4, !dbg !87
  br label %46, !dbg !89

; <label>:27                                      ; preds = %16
  %28 = load i32* %II, align 4, !dbg !90
  %29 = sext i32 %28 to i64, !dbg !90
  %30 = load i8*** %3, align 8, !dbg !90
  %31 = getelementptr inbounds i8** %30, i64 %29, !dbg !90
  %32 = load i8** %31, align 8, !dbg !90
  %33 = call i64 @atol(i8* %32) #5, !dbg !90
  %34 = icmp sgt i64 %33, 0, !dbg !90
  br i1 %34, label %35, label %42, !dbg !90

; <label>:35                                      ; preds = %27
  %36 = load i32* %II, align 4, !dbg !92
  %37 = sext i32 %36 to i64, !dbg !92
  %38 = load i8*** %3, align 8, !dbg !92
  %39 = getelementptr inbounds i8** %38, i64 %37, !dbg !92
  %40 = load i8** %39, align 8, !dbg !92
  %41 = call i64 @atol(i8* %40) #5, !dbg !92
  store i64 %41, i64* %loopstart, align 8, !dbg !92
  br label %45, !dbg !94

; <label>:42                                      ; preds = %27
  %43 = load %struct._IO_FILE** @stderr, align 8, !dbg !95
  %44 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([28 x i8]* @.str1, i32 0, i32 0)), !dbg !95
  store i32 1, i32* %1, !dbg !97
  br label %504, !dbg !97

; <label>:45                                      ; preds = %35
  br label %46

; <label>:46                                      ; preds = %45, %26
  %47 = load i32* %II, align 4, !dbg !98
  %48 = add nsw i32 %47, 1, !dbg !98
  store i32 %48, i32* %II, align 4, !dbg !98
  br label %4, !dbg !99

; <label>:49                                      ; preds = %4
  br label %50, !dbg !99

; <label>:50                                      ; preds = %502, %49
  %51 = call i64 @time(i64* null) #6, !dbg !100
  store i64 %51, i64* %startsec, align 8, !dbg !100
  store double 4.999750e-01, double* @T, align 8, !dbg !101
  store double 5.002500e-01, double* @T1, align 8, !dbg !102
  store double 2.000000e+00, double* @T2, align 8, !dbg !103
  %52 = load i64* %loopstart, align 8, !dbg !104
  store i64 %52, i64* %LOOP, align 8, !dbg !104
  store i32 1, i32* %II, align 4, !dbg !105
  store i32 1, i32* %JJ, align 4, !dbg !106
  br label %53, !dbg !106

; <label>:53                                      ; preds = %496, %50
  store i64 0, i64* %N1, align 8, !dbg !107
  %54 = load i64* %LOOP, align 8, !dbg !108
  %55 = mul nsw i64 12, %54, !dbg !108
  store i64 %55, i64* %N2, align 8, !dbg !108
  %56 = load i64* %LOOP, align 8, !dbg !109
  %57 = mul nsw i64 14, %56, !dbg !109
  store i64 %57, i64* %N3, align 8, !dbg !109
  %58 = load i64* %LOOP, align 8, !dbg !110
  %59 = mul nsw i64 345, %58, !dbg !110
  store i64 %59, i64* %N4, align 8, !dbg !110
  %60 = load i64* %LOOP, align 8, !dbg !111
  %61 = mul nsw i64 210, %60, !dbg !111
  store i64 %61, i64* %N6, align 8, !dbg !111
  %62 = load i64* %LOOP, align 8, !dbg !112
  %63 = mul nsw i64 32, %62, !dbg !112
  store i64 %63, i64* %N7, align 8, !dbg !112
  %64 = load i64* %LOOP, align 8, !dbg !113
  %65 = mul nsw i64 899, %64, !dbg !113
  store i64 %65, i64* %N8, align 8, !dbg !113
  %66 = load i64* %LOOP, align 8, !dbg !114
  %67 = mul nsw i64 616, %66, !dbg !114
  store i64 %67, i64* %N9, align 8, !dbg !114
  store i64 0, i64* %N10, align 8, !dbg !115
  %68 = load i64* %LOOP, align 8, !dbg !116
  %69 = mul nsw i64 93, %68, !dbg !116
  store i64 %69, i64* %N11, align 8, !dbg !116
  store double 1.000000e+00, double* %X1, align 8, !dbg !117
  store double -1.000000e+00, double* %X2, align 8, !dbg !118
  store double -1.000000e+00, double* %X3, align 8, !dbg !119
  store double -1.000000e+00, double* %X4, align 8, !dbg !120
  store i64 1, i64* %I, align 8, !dbg !121
  br label %70, !dbg !121

; <label>:70                                      ; preds = %112, %53
  %71 = load i64* %I, align 8, !dbg !121
  %72 = load i64* %N1, align 8, !dbg !121
  %73 = icmp sle i64 %71, %72, !dbg !121
  br i1 %73, label %74, label %115, !dbg !121

; <label>:74                                      ; preds = %70
  %75 = load double* %X1, align 8, !dbg !123
  %76 = load double* %X2, align 8, !dbg !123
  %77 = fadd double %75, %76, !dbg !123
  %78 = load double* %X3, align 8, !dbg !123
  %79 = fadd double %77, %78, !dbg !123
  %80 = load double* %X4, align 8, !dbg !123
  %81 = fsub double %79, %80, !dbg !123
  %82 = load double* @T, align 8, !dbg !123
  %83 = fmul double %81, %82, !dbg !123
  store double %83, double* %X1, align 8, !dbg !123
  %84 = load double* %X1, align 8, !dbg !125
  %85 = load double* %X2, align 8, !dbg !125
  %86 = fadd double %84, %85, !dbg !125
  %87 = load double* %X3, align 8, !dbg !125
  %88 = fsub double %86, %87, !dbg !125
  %89 = load double* %X4, align 8, !dbg !125
  %90 = fadd double %88, %89, !dbg !125
  %91 = load double* @T, align 8, !dbg !125
  %92 = fmul double %90, %91, !dbg !125
  store double %92, double* %X2, align 8, !dbg !125
  %93 = load double* %X1, align 8, !dbg !126
  %94 = load double* %X2, align 8, !dbg !126
  %95 = fsub double %93, %94, !dbg !126
  %96 = load double* %X3, align 8, !dbg !126
  %97 = fadd double %95, %96, !dbg !126
  %98 = load double* %X4, align 8, !dbg !126
  %99 = fadd double %97, %98, !dbg !126
  %100 = load double* @T, align 8, !dbg !126
  %101 = fmul double %99, %100, !dbg !126
  store double %101, double* %X3, align 8, !dbg !126
  %102 = load double* %X1, align 8, !dbg !127
  %103 = fsub double -0.000000e+00, %102, !dbg !127
  %104 = load double* %X2, align 8, !dbg !127
  %105 = fadd double %103, %104, !dbg !127
  %106 = load double* %X3, align 8, !dbg !127
  %107 = fadd double %105, %106, !dbg !127
  %108 = load double* %X4, align 8, !dbg !127
  %109 = fadd double %107, %108, !dbg !127
  %110 = load double* @T, align 8, !dbg !127
  %111 = fmul double %109, %110, !dbg !127
  store double %111, double* %X4, align 8, !dbg !127
  br label %112, !dbg !128

; <label>:112                                     ; preds = %74
  %113 = load i64* %I, align 8, !dbg !121
  %114 = add nsw i64 %113, 1, !dbg !121
  store i64 %114, i64* %I, align 8, !dbg !121
  br label %70, !dbg !121

; <label>:115                                     ; preds = %70
  %116 = load i32* %JJ, align 4, !dbg !129
  %117 = load i32* %II, align 4, !dbg !129
  %118 = icmp eq i32 %116, %117, !dbg !129
  br i1 %118, label %119, label %127, !dbg !129

; <label>:119                                     ; preds = %115
  %120 = load i64* %N1, align 8, !dbg !129
  %121 = load i64* %N1, align 8, !dbg !129
  %122 = load i64* %N1, align 8, !dbg !129
  %123 = load double* %X1, align 8, !dbg !129
  %124 = load double* %X2, align 8, !dbg !129
  %125 = load double* %X3, align 8, !dbg !129
  %126 = load double* %X4, align 8, !dbg !129
  call void @POUT(i64 %120, i64 %121, i64 %122, double %123, double %124, double %125, double %126), !dbg !129
  br label %127, !dbg !129

; <label>:127                                     ; preds = %119, %115
  store double 1.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 1), align 8, !dbg !131
  store double -1.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 2), align 8, !dbg !132
  store double -1.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 3), align 8, !dbg !133
  store double -1.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 4), align 8, !dbg !134
  store i64 1, i64* %I, align 8, !dbg !135
  br label %128, !dbg !135

; <label>:128                                     ; preds = %170, %127
  %129 = load i64* %I, align 8, !dbg !135
  %130 = load i64* %N2, align 8, !dbg !135
  %131 = icmp sle i64 %129, %130, !dbg !135
  br i1 %131, label %132, label %173, !dbg !135

; <label>:132                                     ; preds = %128
  %133 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 1), align 8, !dbg !137
  %134 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 2), align 8, !dbg !137
  %135 = fadd double %133, %134, !dbg !137
  %136 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 3), align 8, !dbg !137
  %137 = fadd double %135, %136, !dbg !137
  %138 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 4), align 8, !dbg !137
  %139 = fsub double %137, %138, !dbg !137
  %140 = load double* @T, align 8, !dbg !137
  %141 = fmul double %139, %140, !dbg !137
  store double %141, double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 1), align 8, !dbg !137
  %142 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 1), align 8, !dbg !139
  %143 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 2), align 8, !dbg !139
  %144 = fadd double %142, %143, !dbg !139
  %145 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 3), align 8, !dbg !139
  %146 = fsub double %144, %145, !dbg !139
  %147 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 4), align 8, !dbg !139
  %148 = fadd double %146, %147, !dbg !139
  %149 = load double* @T, align 8, !dbg !139
  %150 = fmul double %148, %149, !dbg !139
  store double %150, double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 2), align 8, !dbg !139
  %151 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 1), align 8, !dbg !140
  %152 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 2), align 8, !dbg !140
  %153 = fsub double %151, %152, !dbg !140
  %154 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 3), align 8, !dbg !140
  %155 = fadd double %153, %154, !dbg !140
  %156 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 4), align 8, !dbg !140
  %157 = fadd double %155, %156, !dbg !140
  %158 = load double* @T, align 8, !dbg !140
  %159 = fmul double %157, %158, !dbg !140
  store double %159, double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 3), align 8, !dbg !140
  %160 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 1), align 8, !dbg !141
  %161 = fsub double -0.000000e+00, %160, !dbg !141
  %162 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 2), align 8, !dbg !141
  %163 = fadd double %161, %162, !dbg !141
  %164 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 3), align 8, !dbg !141
  %165 = fadd double %163, %164, !dbg !141
  %166 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 4), align 8, !dbg !141
  %167 = fadd double %165, %166, !dbg !141
  %168 = load double* @T, align 8, !dbg !141
  %169 = fmul double %167, %168, !dbg !141
  store double %169, double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 4), align 8, !dbg !141
  br label %170, !dbg !142

; <label>:170                                     ; preds = %132
  %171 = load i64* %I, align 8, !dbg !135
  %172 = add nsw i64 %171, 1, !dbg !135
  store i64 %172, i64* %I, align 8, !dbg !135
  br label %128, !dbg !135

; <label>:173                                     ; preds = %128
  %174 = load i32* %JJ, align 4, !dbg !143
  %175 = load i32* %II, align 4, !dbg !143
  %176 = icmp eq i32 %174, %175, !dbg !143
  br i1 %176, label %177, label %185, !dbg !143

; <label>:177                                     ; preds = %173
  %178 = load i64* %N2, align 8, !dbg !143
  %179 = load i64* %N3, align 8, !dbg !143
  %180 = load i64* %N2, align 8, !dbg !143
  %181 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 1), align 8, !dbg !143
  %182 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 2), align 8, !dbg !143
  %183 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 3), align 8, !dbg !143
  %184 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 4), align 8, !dbg !143
  call void @POUT(i64 %178, i64 %179, i64 %180, double %181, double %182, double %183, double %184), !dbg !143
  br label %185, !dbg !143

; <label>:185                                     ; preds = %177, %173
  store i64 1, i64* %I, align 8, !dbg !145
  br label %186, !dbg !145

; <label>:186                                     ; preds = %191, %185
  %187 = load i64* %I, align 8, !dbg !145
  %188 = load i64* %N3, align 8, !dbg !145
  %189 = icmp sle i64 %187, %188, !dbg !145
  br i1 %189, label %190, label %194, !dbg !145

; <label>:190                                     ; preds = %186
  call void @PA(double* getelementptr inbounds ([5 x double]* @E1, i32 0, i32 0)), !dbg !147
  br label %191, !dbg !147

; <label>:191                                     ; preds = %190
  %192 = load i64* %I, align 8, !dbg !145
  %193 = add nsw i64 %192, 1, !dbg !145
  store i64 %193, i64* %I, align 8, !dbg !145
  br label %186, !dbg !145

; <label>:194                                     ; preds = %186
  %195 = load i32* %JJ, align 4, !dbg !148
  %196 = load i32* %II, align 4, !dbg !148
  %197 = icmp eq i32 %195, %196, !dbg !148
  br i1 %197, label %198, label %206, !dbg !148

; <label>:198                                     ; preds = %194
  %199 = load i64* %N3, align 8, !dbg !148
  %200 = load i64* %N2, align 8, !dbg !148
  %201 = load i64* %N2, align 8, !dbg !148
  %202 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 1), align 8, !dbg !148
  %203 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 2), align 8, !dbg !148
  %204 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 3), align 8, !dbg !148
  %205 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 4), align 8, !dbg !148
  call void @POUT(i64 %199, i64 %200, i64 %201, double %202, double %203, double %204, double %205), !dbg !148
  br label %206, !dbg !148

; <label>:206                                     ; preds = %198, %194
  store i32 1, i32* @J, align 4, !dbg !150
  store i64 1, i64* %I, align 8, !dbg !151
  br label %207, !dbg !151

; <label>:207                                     ; preds = %227, %206
  %208 = load i64* %I, align 8, !dbg !151
  %209 = load i64* %N4, align 8, !dbg !151
  %210 = icmp sle i64 %208, %209, !dbg !151
  br i1 %210, label %211, label %230, !dbg !151

; <label>:211                                     ; preds = %207
  %212 = load i32* @J, align 4, !dbg !153
  %213 = icmp eq i32 %212, 1, !dbg !153
  br i1 %213, label %214, label %215, !dbg !153

; <label>:214                                     ; preds = %211
  store i32 2, i32* @J, align 4, !dbg !156
  br label %216, !dbg !156

; <label>:215                                     ; preds = %211
  store i32 3, i32* @J, align 4, !dbg !157
  br label %216

; <label>:216                                     ; preds = %215, %214
  %217 = load i32* @J, align 4, !dbg !158
  %218 = icmp sgt i32 %217, 2, !dbg !158
  br i1 %218, label %219, label %220, !dbg !158

; <label>:219                                     ; preds = %216
  store i32 0, i32* @J, align 4, !dbg !160
  br label %221, !dbg !160

; <label>:220                                     ; preds = %216
  store i32 1, i32* @J, align 4, !dbg !161
  br label %221

; <label>:221                                     ; preds = %220, %219
  %222 = load i32* @J, align 4, !dbg !162
  %223 = icmp slt i32 %222, 1, !dbg !162
  br i1 %223, label %224, label %225, !dbg !162

; <label>:224                                     ; preds = %221
  store i32 1, i32* @J, align 4, !dbg !164
  br label %226, !dbg !164

; <label>:225                                     ; preds = %221
  store i32 0, i32* @J, align 4, !dbg !165
  br label %226

; <label>:226                                     ; preds = %225, %224
  br label %227, !dbg !166

; <label>:227                                     ; preds = %226
  %228 = load i64* %I, align 8, !dbg !151
  %229 = add nsw i64 %228, 1, !dbg !151
  store i64 %229, i64* %I, align 8, !dbg !151
  br label %207, !dbg !151

; <label>:230                                     ; preds = %207
  %231 = load i32* %JJ, align 4, !dbg !167
  %232 = load i32* %II, align 4, !dbg !167
  %233 = icmp eq i32 %231, %232, !dbg !167
  br i1 %233, label %234, label %244, !dbg !167

; <label>:234                                     ; preds = %230
  %235 = load i64* %N4, align 8, !dbg !167
  %236 = load i32* @J, align 4, !dbg !167
  %237 = sext i32 %236 to i64, !dbg !167
  %238 = load i32* @J, align 4, !dbg !167
  %239 = sext i32 %238 to i64, !dbg !167
  %240 = load double* %X1, align 8, !dbg !167
  %241 = load double* %X2, align 8, !dbg !167
  %242 = load double* %X3, align 8, !dbg !167
  %243 = load double* %X4, align 8, !dbg !167
  call void @POUT(i64 %235, i64 %237, i64 %239, double %240, double %241, double %242, double %243), !dbg !167
  br label %244, !dbg !167

; <label>:244                                     ; preds = %234, %230
  store i32 1, i32* @J, align 4, !dbg !169
  store i32 2, i32* @K, align 4, !dbg !170
  store i32 3, i32* @L, align 4, !dbg !171
  store i64 1, i64* %I, align 8, !dbg !172
  br label %245, !dbg !172

; <label>:245                                     ; preds = %295, %244
  %246 = load i64* %I, align 8, !dbg !172
  %247 = load i64* %N6, align 8, !dbg !172
  %248 = icmp sle i64 %246, %247, !dbg !172
  br i1 %248, label %249, label %298, !dbg !172

; <label>:249                                     ; preds = %245
  %250 = load i32* @J, align 4, !dbg !174
  %251 = load i32* @K, align 4, !dbg !174
  %252 = load i32* @J, align 4, !dbg !174
  %253 = sub nsw i32 %251, %252, !dbg !174
  %254 = mul nsw i32 %250, %253, !dbg !174
  %255 = load i32* @L, align 4, !dbg !174
  %256 = load i32* @K, align 4, !dbg !174
  %257 = sub nsw i32 %255, %256, !dbg !174
  %258 = mul nsw i32 %254, %257, !dbg !174
  store i32 %258, i32* @J, align 4, !dbg !174
  %259 = load i32* @L, align 4, !dbg !176
  %260 = load i32* @K, align 4, !dbg !176
  %261 = mul nsw i32 %259, %260, !dbg !176
  %262 = load i32* @L, align 4, !dbg !176
  %263 = load i32* @J, align 4, !dbg !176
  %264 = sub nsw i32 %262, %263, !dbg !176
  %265 = load i32* @K, align 4, !dbg !176
  %266 = mul nsw i32 %264, %265, !dbg !176
  %267 = sub nsw i32 %261, %266, !dbg !176
  store i32 %267, i32* @K, align 4, !dbg !176
  %268 = load i32* @L, align 4, !dbg !177
  %269 = load i32* @K, align 4, !dbg !177
  %270 = sub nsw i32 %268, %269, !dbg !177
  %271 = load i32* @K, align 4, !dbg !177
  %272 = load i32* @J, align 4, !dbg !177
  %273 = add nsw i32 %271, %272, !dbg !177
  %274 = mul nsw i32 %270, %273, !dbg !177
  store i32 %274, i32* @L, align 4, !dbg !177
  %275 = load i32* @J, align 4, !dbg !178
  %276 = load i32* @K, align 4, !dbg !178
  %277 = add nsw i32 %275, %276, !dbg !178
  %278 = load i32* @L, align 4, !dbg !178
  %279 = add nsw i32 %277, %278, !dbg !178
  %280 = sitofp i32 %279 to double, !dbg !178
  %281 = load i32* @L, align 4, !dbg !178
  %282 = sub nsw i32 %281, 1, !dbg !178
  %283 = sext i32 %282 to i64, !dbg !178
  %284 = getelementptr inbounds [5 x double]* @E1, i32 0, i64 %283, !dbg !178
  store double %280, double* %284, align 8, !dbg !178
  %285 = load i32* @J, align 4, !dbg !179
  %286 = load i32* @K, align 4, !dbg !179
  %287 = mul nsw i32 %285, %286, !dbg !179
  %288 = load i32* @L, align 4, !dbg !179
  %289 = mul nsw i32 %287, %288, !dbg !179
  %290 = sitofp i32 %289 to double, !dbg !179
  %291 = load i32* @K, align 4, !dbg !179
  %292 = sub nsw i32 %291, 1, !dbg !179
  %293 = sext i32 %292 to i64, !dbg !179
  %294 = getelementptr inbounds [5 x double]* @E1, i32 0, i64 %293, !dbg !179
  store double %290, double* %294, align 8, !dbg !179
  br label %295, !dbg !180

; <label>:295                                     ; preds = %249
  %296 = load i64* %I, align 8, !dbg !172
  %297 = add nsw i64 %296, 1, !dbg !172
  store i64 %297, i64* %I, align 8, !dbg !172
  br label %245, !dbg !172

; <label>:298                                     ; preds = %245
  %299 = load i32* %JJ, align 4, !dbg !181
  %300 = load i32* %II, align 4, !dbg !181
  %301 = icmp eq i32 %299, %300, !dbg !181
  br i1 %301, label %302, label %312, !dbg !181

; <label>:302                                     ; preds = %298
  %303 = load i64* %N6, align 8, !dbg !181
  %304 = load i32* @J, align 4, !dbg !181
  %305 = sext i32 %304 to i64, !dbg !181
  %306 = load i32* @K, align 4, !dbg !181
  %307 = sext i32 %306 to i64, !dbg !181
  %308 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 1), align 8, !dbg !181
  %309 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 2), align 8, !dbg !181
  %310 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 3), align 8, !dbg !181
  %311 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 4), align 8, !dbg !181
  call void @POUT(i64 %303, i64 %305, i64 %307, double %308, double %309, double %310, double %311), !dbg !181
  br label %312, !dbg !181

; <label>:312                                     ; preds = %302, %298
  store double 5.000000e-01, double* %X, align 8, !dbg !183
  store double 5.000000e-01, double* %Y, align 8, !dbg !184
  store i64 1, i64* %I, align 8, !dbg !185
  br label %313, !dbg !185

; <label>:313                                     ; preds = %360, %312
  %314 = load i64* %I, align 8, !dbg !185
  %315 = load i64* %N7, align 8, !dbg !185
  %316 = icmp sle i64 %314, %315, !dbg !185
  br i1 %316, label %317, label %363, !dbg !185

; <label>:317                                     ; preds = %313
  %318 = load double* @T, align 8, !dbg !187
  %319 = load double* @T2, align 8, !dbg !187
  %320 = load double* %X, align 8, !dbg !187
  %321 = call double @sin(double %320) #6, !dbg !187
  %322 = fmul double %319, %321, !dbg !187
  %323 = load double* %X, align 8, !dbg !187
  %324 = call double @cos(double %323) #6, !dbg !187
  %325 = fmul double %322, %324, !dbg !187
  %326 = load double* %X, align 8, !dbg !187
  %327 = load double* %Y, align 8, !dbg !187
  %328 = fadd double %326, %327, !dbg !187
  %329 = call double @cos(double %328) #6, !dbg !187
  %330 = load double* %X, align 8, !dbg !187
  %331 = load double* %Y, align 8, !dbg !187
  %332 = fsub double %330, %331, !dbg !187
  %333 = call double @cos(double %332) #6, !dbg !187
  %334 = fadd double %329, %333, !dbg !187
  %335 = fsub double %334, 1.000000e+00, !dbg !187
  %336 = fdiv double %325, %335, !dbg !187
  %337 = call double @atan(double %336) #6, !dbg !187
  %338 = fmul double %318, %337, !dbg !187
  store double %338, double* %X, align 8, !dbg !187
  %339 = load double* @T, align 8, !dbg !189
  %340 = load double* @T2, align 8, !dbg !189
  %341 = load double* %Y, align 8, !dbg !189
  %342 = call double @sin(double %341) #6, !dbg !189
  %343 = fmul double %340, %342, !dbg !189
  %344 = load double* %Y, align 8, !dbg !189
  %345 = call double @cos(double %344) #6, !dbg !189
  %346 = fmul double %343, %345, !dbg !189
  %347 = load double* %X, align 8, !dbg !189
  %348 = load double* %Y, align 8, !dbg !189
  %349 = fadd double %347, %348, !dbg !189
  %350 = call double @cos(double %349) #6, !dbg !189
  %351 = load double* %X, align 8, !dbg !189
  %352 = load double* %Y, align 8, !dbg !189
  %353 = fsub double %351, %352, !dbg !189
  %354 = call double @cos(double %353) #6, !dbg !189
  %355 = fadd double %350, %354, !dbg !189
  %356 = fsub double %355, 1.000000e+00, !dbg !189
  %357 = fdiv double %346, %356, !dbg !189
  %358 = call double @atan(double %357) #6, !dbg !189
  %359 = fmul double %339, %358, !dbg !189
  store double %359, double* %Y, align 8, !dbg !189
  br label %360, !dbg !190

; <label>:360                                     ; preds = %317
  %361 = load i64* %I, align 8, !dbg !185
  %362 = add nsw i64 %361, 1, !dbg !185
  store i64 %362, i64* %I, align 8, !dbg !185
  br label %313, !dbg !185

; <label>:363                                     ; preds = %313
  %364 = load i32* %JJ, align 4, !dbg !191
  %365 = load i32* %II, align 4, !dbg !191
  %366 = icmp eq i32 %364, %365, !dbg !191
  br i1 %366, label %367, label %377, !dbg !191

; <label>:367                                     ; preds = %363
  %368 = load i64* %N7, align 8, !dbg !191
  %369 = load i32* @J, align 4, !dbg !191
  %370 = sext i32 %369 to i64, !dbg !191
  %371 = load i32* @K, align 4, !dbg !191
  %372 = sext i32 %371 to i64, !dbg !191
  %373 = load double* %X, align 8, !dbg !191
  %374 = load double* %X, align 8, !dbg !191
  %375 = load double* %Y, align 8, !dbg !191
  %376 = load double* %Y, align 8, !dbg !191
  call void @POUT(i64 %368, i64 %370, i64 %372, double %373, double %374, double %375, double %376), !dbg !191
  br label %377, !dbg !191

; <label>:377                                     ; preds = %367, %363
  store double 1.000000e+00, double* %X, align 8, !dbg !193
  store double 1.000000e+00, double* %Y, align 8, !dbg !194
  store double 1.000000e+00, double* %Z, align 8, !dbg !195
  store i64 1, i64* %I, align 8, !dbg !196
  br label %378, !dbg !196

; <label>:378                                     ; preds = %385, %377
  %379 = load i64* %I, align 8, !dbg !196
  %380 = load i64* %N8, align 8, !dbg !196
  %381 = icmp sle i64 %379, %380, !dbg !196
  br i1 %381, label %382, label %388, !dbg !196

; <label>:382                                     ; preds = %378
  %383 = load double* %X, align 8, !dbg !198
  %384 = load double* %Y, align 8, !dbg !198
  call void @P3(double %383, double %384, double* %Z), !dbg !198
  br label %385, !dbg !198

; <label>:385                                     ; preds = %382
  %386 = load i64* %I, align 8, !dbg !196
  %387 = add nsw i64 %386, 1, !dbg !196
  store i64 %387, i64* %I, align 8, !dbg !196
  br label %378, !dbg !196

; <label>:388                                     ; preds = %378
  %389 = load i32* %JJ, align 4, !dbg !199
  %390 = load i32* %II, align 4, !dbg !199
  %391 = icmp eq i32 %389, %390, !dbg !199
  br i1 %391, label %392, label %402, !dbg !199

; <label>:392                                     ; preds = %388
  %393 = load i64* %N8, align 8, !dbg !199
  %394 = load i32* @J, align 4, !dbg !199
  %395 = sext i32 %394 to i64, !dbg !199
  %396 = load i32* @K, align 4, !dbg !199
  %397 = sext i32 %396 to i64, !dbg !199
  %398 = load double* %X, align 8, !dbg !199
  %399 = load double* %Y, align 8, !dbg !199
  %400 = load double* %Z, align 8, !dbg !199
  %401 = load double* %Z, align 8, !dbg !199
  call void @POUT(i64 %393, i64 %395, i64 %397, double %398, double %399, double %400, double %401), !dbg !199
  br label %402, !dbg !199

; <label>:402                                     ; preds = %392, %388
  store i32 1, i32* @J, align 4, !dbg !201
  store i32 2, i32* @K, align 4, !dbg !202
  store i32 3, i32* @L, align 4, !dbg !203
  store double 1.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 1), align 8, !dbg !204
  store double 2.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 2), align 8, !dbg !205
  store double 3.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 3), align 8, !dbg !206
  store i64 1, i64* %I, align 8, !dbg !207
  br label %403, !dbg !207

; <label>:403                                     ; preds = %408, %402
  %404 = load i64* %I, align 8, !dbg !207
  %405 = load i64* %N9, align 8, !dbg !207
  %406 = icmp sle i64 %404, %405, !dbg !207
  br i1 %406, label %407, label %411, !dbg !207

; <label>:407                                     ; preds = %403
  call void @P0(), !dbg !209
  br label %408, !dbg !209

; <label>:408                                     ; preds = %407
  %409 = load i64* %I, align 8, !dbg !207
  %410 = add nsw i64 %409, 1, !dbg !207
  store i64 %410, i64* %I, align 8, !dbg !207
  br label %403, !dbg !207

; <label>:411                                     ; preds = %403
  %412 = load i32* %JJ, align 4, !dbg !210
  %413 = load i32* %II, align 4, !dbg !210
  %414 = icmp eq i32 %412, %413, !dbg !210
  br i1 %414, label %415, label %425, !dbg !210

; <label>:415                                     ; preds = %411
  %416 = load i64* %N9, align 8, !dbg !210
  %417 = load i32* @J, align 4, !dbg !210
  %418 = sext i32 %417 to i64, !dbg !210
  %419 = load i32* @K, align 4, !dbg !210
  %420 = sext i32 %419 to i64, !dbg !210
  %421 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 1), align 8, !dbg !210
  %422 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 2), align 8, !dbg !210
  %423 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 3), align 8, !dbg !210
  %424 = load double* getelementptr inbounds ([5 x double]* @E1, i32 0, i64 4), align 8, !dbg !210
  call void @POUT(i64 %416, i64 %418, i64 %420, double %421, double %422, double %423, double %424), !dbg !210
  br label %425, !dbg !210

; <label>:425                                     ; preds = %415, %411
  store i32 2, i32* @J, align 4, !dbg !212
  store i32 3, i32* @K, align 4, !dbg !213
  store i64 1, i64* %I, align 8, !dbg !214
  br label %426, !dbg !214

; <label>:426                                     ; preds = %445, %425
  %427 = load i64* %I, align 8, !dbg !214
  %428 = load i64* %N10, align 8, !dbg !214
  %429 = icmp sle i64 %427, %428, !dbg !214
  br i1 %429, label %430, label %448, !dbg !214

; <label>:430                                     ; preds = %426
  %431 = load i32* @J, align 4, !dbg !216
  %432 = load i32* @K, align 4, !dbg !216
  %433 = add nsw i32 %431, %432, !dbg !216
  store i32 %433, i32* @J, align 4, !dbg !216
  %434 = load i32* @J, align 4, !dbg !218
  %435 = load i32* @K, align 4, !dbg !218
  %436 = add nsw i32 %434, %435, !dbg !218
  store i32 %436, i32* @K, align 4, !dbg !218
  %437 = load i32* @K, align 4, !dbg !219
  %438 = load i32* @J, align 4, !dbg !219
  %439 = sub nsw i32 %437, %438, !dbg !219
  store i32 %439, i32* @J, align 4, !dbg !219
  %440 = load i32* @K, align 4, !dbg !220
  %441 = load i32* @J, align 4, !dbg !220
  %442 = sub nsw i32 %440, %441, !dbg !220
  %443 = load i32* @J, align 4, !dbg !220
  %444 = sub nsw i32 %442, %443, !dbg !220
  store i32 %444, i32* @K, align 4, !dbg !220
  br label %445, !dbg !221

; <label>:445                                     ; preds = %430
  %446 = load i64* %I, align 8, !dbg !214
  %447 = add nsw i64 %446, 1, !dbg !214
  store i64 %447, i64* %I, align 8, !dbg !214
  br label %426, !dbg !214

; <label>:448                                     ; preds = %426
  %449 = load i32* %JJ, align 4, !dbg !222
  %450 = load i32* %II, align 4, !dbg !222
  %451 = icmp eq i32 %449, %450, !dbg !222
  br i1 %451, label %452, label %462, !dbg !222

; <label>:452                                     ; preds = %448
  %453 = load i64* %N10, align 8, !dbg !222
  %454 = load i32* @J, align 4, !dbg !222
  %455 = sext i32 %454 to i64, !dbg !222
  %456 = load i32* @K, align 4, !dbg !222
  %457 = sext i32 %456 to i64, !dbg !222
  %458 = load double* %X1, align 8, !dbg !222
  %459 = load double* %X2, align 8, !dbg !222
  %460 = load double* %X3, align 8, !dbg !222
  %461 = load double* %X4, align 8, !dbg !222
  call void @POUT(i64 %453, i64 %455, i64 %457, double %458, double %459, double %460, double %461), !dbg !222
  br label %462, !dbg !222

; <label>:462                                     ; preds = %452, %448
  store double 7.500000e-01, double* %X, align 8, !dbg !224
  store i64 1, i64* %I, align 8, !dbg !225
  br label %463, !dbg !225

; <label>:463                                     ; preds = %474, %462
  %464 = load i64* %I, align 8, !dbg !225
  %465 = load i64* %N11, align 8, !dbg !225
  %466 = icmp sle i64 %464, %465, !dbg !225
  br i1 %466, label %467, label %477, !dbg !225

; <label>:467                                     ; preds = %463
  %468 = load double* %X, align 8, !dbg !227
  %469 = call double @log(double %468) #6, !dbg !227
  %470 = load double* @T1, align 8, !dbg !227
  %471 = fdiv double %469, %470, !dbg !227
  %472 = call double @exp(double %471) #6, !dbg !227
  %473 = call double @sqrt(double %472) #6, !dbg !227
  store double %473, double* %X, align 8, !dbg !227
  br label %474, !dbg !227

; <label>:474                                     ; preds = %467
  %475 = load i64* %I, align 8, !dbg !225
  %476 = add nsw i64 %475, 1, !dbg !225
  store i64 %476, i64* %I, align 8, !dbg !225
  br label %463, !dbg !225

; <label>:477                                     ; preds = %463
  %478 = load i32* %JJ, align 4, !dbg !228
  %479 = load i32* %II, align 4, !dbg !228
  %480 = icmp eq i32 %478, %479, !dbg !228
  br i1 %480, label %481, label %491, !dbg !228

; <label>:481                                     ; preds = %477
  %482 = load i64* %N11, align 8, !dbg !228
  %483 = load i32* @J, align 4, !dbg !228
  %484 = sext i32 %483 to i64, !dbg !228
  %485 = load i32* @K, align 4, !dbg !228
  %486 = sext i32 %485 to i64, !dbg !228
  %487 = load double* %X, align 8, !dbg !228
  %488 = load double* %X, align 8, !dbg !228
  %489 = load double* %X, align 8, !dbg !228
  %490 = load double* %X, align 8, !dbg !228
  call void @POUT(i64 %482, i64 %484, i64 %486, double %487, double %488, double %489, double %490), !dbg !228
  br label %491, !dbg !228

; <label>:491                                     ; preds = %481, %477
  %492 = load i32* %JJ, align 4, !dbg !230
  %493 = add nsw i32 %492, 1, !dbg !230
  store i32 %493, i32* %JJ, align 4, !dbg !230
  %494 = load i32* %II, align 4, !dbg !230
  %495 = icmp sle i32 %493, %494, !dbg !230
  br i1 %495, label %496, label %497, !dbg !230

; <label>:496                                     ; preds = %491
  br label %53, !dbg !232

; <label>:497                                     ; preds = %491
  %498 = call i64 @time(i64* null) #6, !dbg !233
  store i64 %498, i64* %finisec, align 8, !dbg !233
  %499 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !234
  %500 = load i32* %continuous, align 4, !dbg !235
  %501 = icmp ne i32 %500, 0, !dbg !235
  br i1 %501, label %502, label %503, !dbg !235

; <label>:502                                     ; preds = %497
  br label %50, !dbg !237

; <label>:503                                     ; preds = %497
  store i32 0, i32* %1, !dbg !238
  br label %504, !dbg !238

; <label>:504                                     ; preds = %503, %42
  %505 = load i32* %1, !dbg !239
  ret i32 %505, !dbg !239
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8*, i8*, i64) #2

; Function Attrs: nounwind readonly
declare i64 @atol(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: nounwind
declare i64 @time(i64*) #4

; Function Attrs: nounwind uwtable
define void @POUT(i64 %N, i64 %J, i64 %K, double %X1, double %X2, double %X3, double %X4) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  store i64 %N, i64* %1, align 8
  call void @llvm.dbg.declare(metadata !{i64* %1}, metadata !240), !dbg !241
  store i64 %J, i64* %2, align 8
  call void @llvm.dbg.declare(metadata !{i64* %2}, metadata !242), !dbg !241
  store i64 %K, i64* %3, align 8
  call void @llvm.dbg.declare(metadata !{i64* %3}, metadata !243), !dbg !241
  store double %X1, double* %4, align 8
  call void @llvm.dbg.declare(metadata !{double* %4}, metadata !244), !dbg !241
  store double %X2, double* %5, align 8
  call void @llvm.dbg.declare(metadata !{double* %5}, metadata !245), !dbg !241
  store double %X3, double* %6, align 8
  call void @llvm.dbg.declare(metadata !{double* %6}, metadata !246), !dbg !241
  store double %X4, double* %7, align 8
  call void @llvm.dbg.declare(metadata !{double* %7}, metadata !247), !dbg !241
  %8 = load i64* %1, align 8, !dbg !248
  %9 = load i64* %2, align 8, !dbg !248
  %10 = load i64* %3, align 8, !dbg !248
  %11 = load double* %4, align 8, !dbg !248
  %12 = load double* %5, align 8, !dbg !248
  %13 = load double* %6, align 8, !dbg !248
  %14 = load double* %7, align 8, !dbg !248
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i32 0, i32 0), i64 %8, i64 %9, i64 %10, double %11, double %12, double %13, double %14), !dbg !248
  ret void, !dbg !249
}

; Function Attrs: nounwind uwtable
define void @PA(double* %E) #0 {
  %1 = alloca double*, align 8
  store double* %E, double** %1, align 8
  call void @llvm.dbg.declare(metadata !{double** %1}, metadata !250), !dbg !251
  store i32 0, i32* @J, align 4, !dbg !252
  br label %2, !dbg !252

; <label>:2                                       ; preds = %84, %0
  %3 = load double** %1, align 8, !dbg !253
  %4 = getelementptr inbounds double* %3, i64 1, !dbg !253
  %5 = load double* %4, align 8, !dbg !253
  %6 = load double** %1, align 8, !dbg !253
  %7 = getelementptr inbounds double* %6, i64 2, !dbg !253
  %8 = load double* %7, align 8, !dbg !253
  %9 = fadd double %5, %8, !dbg !253
  %10 = load double** %1, align 8, !dbg !253
  %11 = getelementptr inbounds double* %10, i64 3, !dbg !253
  %12 = load double* %11, align 8, !dbg !253
  %13 = fadd double %9, %12, !dbg !253
  %14 = load double** %1, align 8, !dbg !253
  %15 = getelementptr inbounds double* %14, i64 4, !dbg !253
  %16 = load double* %15, align 8, !dbg !253
  %17 = fsub double %13, %16, !dbg !253
  %18 = load double* @T, align 8, !dbg !253
  %19 = fmul double %17, %18, !dbg !253
  %20 = load double** %1, align 8, !dbg !253
  %21 = getelementptr inbounds double* %20, i64 1, !dbg !253
  store double %19, double* %21, align 8, !dbg !253
  %22 = load double** %1, align 8, !dbg !254
  %23 = getelementptr inbounds double* %22, i64 1, !dbg !254
  %24 = load double* %23, align 8, !dbg !254
  %25 = load double** %1, align 8, !dbg !254
  %26 = getelementptr inbounds double* %25, i64 2, !dbg !254
  %27 = load double* %26, align 8, !dbg !254
  %28 = fadd double %24, %27, !dbg !254
  %29 = load double** %1, align 8, !dbg !254
  %30 = getelementptr inbounds double* %29, i64 3, !dbg !254
  %31 = load double* %30, align 8, !dbg !254
  %32 = fsub double %28, %31, !dbg !254
  %33 = load double** %1, align 8, !dbg !254
  %34 = getelementptr inbounds double* %33, i64 4, !dbg !254
  %35 = load double* %34, align 8, !dbg !254
  %36 = fadd double %32, %35, !dbg !254
  %37 = load double* @T, align 8, !dbg !254
  %38 = fmul double %36, %37, !dbg !254
  %39 = load double** %1, align 8, !dbg !254
  %40 = getelementptr inbounds double* %39, i64 2, !dbg !254
  store double %38, double* %40, align 8, !dbg !254
  %41 = load double** %1, align 8, !dbg !255
  %42 = getelementptr inbounds double* %41, i64 1, !dbg !255
  %43 = load double* %42, align 8, !dbg !255
  %44 = load double** %1, align 8, !dbg !255
  %45 = getelementptr inbounds double* %44, i64 2, !dbg !255
  %46 = load double* %45, align 8, !dbg !255
  %47 = fsub double %43, %46, !dbg !255
  %48 = load double** %1, align 8, !dbg !255
  %49 = getelementptr inbounds double* %48, i64 3, !dbg !255
  %50 = load double* %49, align 8, !dbg !255
  %51 = fadd double %47, %50, !dbg !255
  %52 = load double** %1, align 8, !dbg !255
  %53 = getelementptr inbounds double* %52, i64 4, !dbg !255
  %54 = load double* %53, align 8, !dbg !255
  %55 = fadd double %51, %54, !dbg !255
  %56 = load double* @T, align 8, !dbg !255
  %57 = fmul double %55, %56, !dbg !255
  %58 = load double** %1, align 8, !dbg !255
  %59 = getelementptr inbounds double* %58, i64 3, !dbg !255
  store double %57, double* %59, align 8, !dbg !255
  %60 = load double** %1, align 8, !dbg !256
  %61 = getelementptr inbounds double* %60, i64 1, !dbg !256
  %62 = load double* %61, align 8, !dbg !256
  %63 = fsub double -0.000000e+00, %62, !dbg !256
  %64 = load double** %1, align 8, !dbg !256
  %65 = getelementptr inbounds double* %64, i64 2, !dbg !256
  %66 = load double* %65, align 8, !dbg !256
  %67 = fadd double %63, %66, !dbg !256
  %68 = load double** %1, align 8, !dbg !256
  %69 = getelementptr inbounds double* %68, i64 3, !dbg !256
  %70 = load double* %69, align 8, !dbg !256
  %71 = fadd double %67, %70, !dbg !256
  %72 = load double** %1, align 8, !dbg !256
  %73 = getelementptr inbounds double* %72, i64 4, !dbg !256
  %74 = load double* %73, align 8, !dbg !256
  %75 = fadd double %71, %74, !dbg !256
  %76 = load double* @T2, align 8, !dbg !256
  %77 = fdiv double %75, %76, !dbg !256
  %78 = load double** %1, align 8, !dbg !256
  %79 = getelementptr inbounds double* %78, i64 4, !dbg !256
  store double %77, double* %79, align 8, !dbg !256
  %80 = load i32* @J, align 4, !dbg !257
  %81 = add nsw i32 %80, 1, !dbg !257
  store i32 %81, i32* @J, align 4, !dbg !257
  %82 = load i32* @J, align 4, !dbg !258
  %83 = icmp slt i32 %82, 6, !dbg !258
  br i1 %83, label %84, label %85, !dbg !258

; <label>:84                                      ; preds = %2
  br label %2, !dbg !260

; <label>:85                                      ; preds = %2
  ret void, !dbg !261
}

; Function Attrs: nounwind
declare double @atan(double) #4

; Function Attrs: nounwind
declare double @sin(double) #4

; Function Attrs: nounwind
declare double @cos(double) #4

; Function Attrs: nounwind uwtable
define void @P3(double %X, double %Y, double* %Z) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  %3 = alloca double*, align 8
  %X1 = alloca double, align 8
  %Y1 = alloca double, align 8
  store double %X, double* %1, align 8
  call void @llvm.dbg.declare(metadata !{double* %1}, metadata !262), !dbg !263
  store double %Y, double* %2, align 8
  call void @llvm.dbg.declare(metadata !{double* %2}, metadata !264), !dbg !263
  store double* %Z, double** %3, align 8
  call void @llvm.dbg.declare(metadata !{double** %3}, metadata !265), !dbg !263
  call void @llvm.dbg.declare(metadata !{double* %X1}, metadata !266), !dbg !267
  call void @llvm.dbg.declare(metadata !{double* %Y1}, metadata !268), !dbg !267
  %4 = load double* %1, align 8, !dbg !269
  store double %4, double* %X1, align 8, !dbg !269
  %5 = load double* %2, align 8, !dbg !270
  store double %5, double* %Y1, align 8, !dbg !270
  %6 = load double* @T, align 8, !dbg !271
  %7 = load double* %X1, align 8, !dbg !271
  %8 = load double* %Y1, align 8, !dbg !271
  %9 = fadd double %7, %8, !dbg !271
  %10 = fmul double %6, %9, !dbg !271
  store double %10, double* %X1, align 8, !dbg !271
  %11 = load double* @T, align 8, !dbg !272
  %12 = load double* %X1, align 8, !dbg !272
  %13 = load double* %Y1, align 8, !dbg !272
  %14 = fadd double %12, %13, !dbg !272
  %15 = fmul double %11, %14, !dbg !272
  store double %15, double* %Y1, align 8, !dbg !272
  %16 = load double* %X1, align 8, !dbg !273
  %17 = load double* %Y1, align 8, !dbg !273
  %18 = fadd double %16, %17, !dbg !273
  %19 = load double* @T2, align 8, !dbg !273
  %20 = fdiv double %18, %19, !dbg !273
  %21 = load double** %3, align 8, !dbg !273
  store double %20, double* %21, align 8, !dbg !273
  ret void, !dbg !274
}

; Function Attrs: nounwind uwtable
define void @P0() #0 {
  %1 = load i32* @K, align 4, !dbg !275
  %2 = sext i32 %1 to i64, !dbg !275
  %3 = getelementptr inbounds [5 x double]* @E1, i32 0, i64 %2, !dbg !275
  %4 = load double* %3, align 8, !dbg !275
  %5 = load i32* @J, align 4, !dbg !275
  %6 = sext i32 %5 to i64, !dbg !275
  %7 = getelementptr inbounds [5 x double]* @E1, i32 0, i64 %6, !dbg !275
  store double %4, double* %7, align 8, !dbg !275
  %8 = load i32* @L, align 4, !dbg !276
  %9 = sext i32 %8 to i64, !dbg !276
  %10 = getelementptr inbounds [5 x double]* @E1, i32 0, i64 %9, !dbg !276
  %11 = load double* %10, align 8, !dbg !276
  %12 = load i32* @K, align 4, !dbg !276
  %13 = sext i32 %12 to i64, !dbg !276
  %14 = getelementptr inbounds [5 x double]* @E1, i32 0, i64 %13, !dbg !276
  store double %11, double* %14, align 8, !dbg !276
  %15 = load i32* @J, align 4, !dbg !277
  %16 = sext i32 %15 to i64, !dbg !277
  %17 = getelementptr inbounds [5 x double]* @E1, i32 0, i64 %16, !dbg !277
  %18 = load double* %17, align 8, !dbg !277
  %19 = load i32* @L, align 4, !dbg !277
  %20 = sext i32 %19 to i64, !dbg !277
  %21 = getelementptr inbounds [5 x double]* @E1, i32 0, i64 %20, !dbg !277
  store double %18, double* %21, align 8, !dbg !277
  ret void, !dbg !278
}

; Function Attrs: nounwind
declare double @sqrt(double) #4

; Function Attrs: nounwind
declare double @exp(double) #4

; Function Attrs: nounwind
declare double @log(double) #4

declare i32 @printf(i8*, ...) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!38, !39}
!llvm.ident = !{!40}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !27, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c] [DW_LANG_C99]
!1 = metadata !{metadata !"whetstone.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !12, metadata !17, metadata !20, metadata !23}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 87, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 88} ; [ DW_TAG_subprogram ] [line 87] [def] [scope 88] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"PA", metadata !"PA", metadata !"", i32 397, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (double*)* @PA, null, null, metadata !2, i32 398} ; [ DW_TAG_subprogram ] [line 397] [def] [scope 398] [PA]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{null, metadata !15}
!15 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!16 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!17 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"P0", metadata !"P0", metadata !"", i32 413, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @P0, null, null, metadata !2, i32 414} ; [ DW_TAG_subprogram ] [line 413] [def] [scope 414] [P0]
!18 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{null}
!20 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"P3", metadata !"P3", metadata !"", i32 421, metadata !21, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (double, double, double*)* @P3, null, null, metadata !2, i32 422} ; [ DW_TAG_subprogram ] [line 421] [def] [scope 422] [P3]
!21 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !22, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = metadata !{null, metadata !16, metadata !16, metadata !15}
!23 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"POUT", metadata !"POUT", metadata !"", i32 434, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i64, i64, i64, double, double, double, double)* @POUT, null, null, metadata !2, i32 435} ; [ DW_TAG_subprogram ] [line 434] [def] [scope 435] [POUT]
!24 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = metadata !{null, metadata !26, metadata !26, metadata !26, metadata !16, metadata !16, metadata !16, metadata !16}
!26 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!27 = metadata !{metadata !28, metadata !29, metadata !30, metadata !31, metadata !35, metadata !36, metadata !37}
!28 = metadata !{i32 786484, i32 0, null, metadata !"T", metadata !"T", metadata !"", metadata !5, i32 83, metadata !16, i32 0, i32 1, double* @T, null} ; [ DW_TAG_variable ] [T] [line 83] [def]
!29 = metadata !{i32 786484, i32 0, null, metadata !"T1", metadata !"T1", metadata !"", metadata !5, i32 83, metadata !16, i32 0, i32 1, double* @T1, null} ; [ DW_TAG_variable ] [T1] [line 83] [def]
!30 = metadata !{i32 786484, i32 0, null, metadata !"T2", metadata !"T2", metadata !"", metadata !5, i32 83, metadata !16, i32 0, i32 1, double* @T2, null} ; [ DW_TAG_variable ] [T2] [line 83] [def]
!31 = metadata !{i32 786484, i32 0, null, metadata !"E1", metadata !"E1", metadata !"", metadata !5, i32 83, metadata !32, i32 0, i32 1, [5 x double]* @E1, null} ; [ DW_TAG_variable ] [E1] [line 83] [def]
!32 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 320, i64 64, i32 0, i32 0, metadata !16, metadata !33, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 320, align 64, offset 0] [from double]
!33 = metadata !{metadata !34}
!34 = metadata !{i32 786465, i64 0, i64 5}        ; [ DW_TAG_subrange_type ] [0, 4]
!35 = metadata !{i32 786484, i32 0, null, metadata !"J", metadata !"J", metadata !"", metadata !5, i32 84, metadata !8, i32 0, i32 1, i32* @J, null} ; [ DW_TAG_variable ] [J] [line 84] [def]
!36 = metadata !{i32 786484, i32 0, null, metadata !"K", metadata !"K", metadata !"", metadata !5, i32 84, metadata !8, i32 0, i32 1, i32* @K, null} ; [ DW_TAG_variable ] [K] [line 84] [def]
!37 = metadata !{i32 786484, i32 0, null, metadata !"L", metadata !"L", metadata !"", metadata !5, i32 84, metadata !8, i32 0, i32 1, i32* @L, null} ; [ DW_TAG_variable ] [L] [line 84] [def]
!38 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!39 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!40 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!41 = metadata !{i32 786689, metadata !4, metadata !"argc", metadata !5, i32 16777303, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 87]
!42 = metadata !{i32 87, i32 0, metadata !4, null}
!43 = metadata !{i32 786689, metadata !4, metadata !"argv", metadata !5, i32 33554519, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 87]
!44 = metadata !{i32 786688, metadata !4, metadata !"I", metadata !5, i32 90, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [I] [line 90]
!45 = metadata !{i32 90, i32 0, metadata !4, null}
!46 = metadata !{i32 786688, metadata !4, metadata !"N1", metadata !5, i32 91, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [N1] [line 91]
!47 = metadata !{i32 91, i32 0, metadata !4, null}
!48 = metadata !{i32 786688, metadata !4, metadata !"N2", metadata !5, i32 91, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [N2] [line 91]
!49 = metadata !{i32 786688, metadata !4, metadata !"N3", metadata !5, i32 91, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [N3] [line 91]
!50 = metadata !{i32 786688, metadata !4, metadata !"N4", metadata !5, i32 91, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [N4] [line 91]
!51 = metadata !{i32 786688, metadata !4, metadata !"N6", metadata !5, i32 91, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [N6] [line 91]
!52 = metadata !{i32 786688, metadata !4, metadata !"N7", metadata !5, i32 91, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [N7] [line 91]
!53 = metadata !{i32 786688, metadata !4, metadata !"N8", metadata !5, i32 91, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [N8] [line 91]
!54 = metadata !{i32 786688, metadata !4, metadata !"N9", metadata !5, i32 91, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [N9] [line 91]
!55 = metadata !{i32 786688, metadata !4, metadata !"N10", metadata !5, i32 91, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [N10] [line 91]
!56 = metadata !{i32 786688, metadata !4, metadata !"N11", metadata !5, i32 91, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [N11] [line 91]
!57 = metadata !{i32 786688, metadata !4, metadata !"X1", metadata !5, i32 92, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [X1] [line 92]
!58 = metadata !{i32 92, i32 0, metadata !4, null}
!59 = metadata !{i32 786688, metadata !4, metadata !"X2", metadata !5, i32 92, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [X2] [line 92]
!60 = metadata !{i32 786688, metadata !4, metadata !"X3", metadata !5, i32 92, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [X3] [line 92]
!61 = metadata !{i32 786688, metadata !4, metadata !"X4", metadata !5, i32 92, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [X4] [line 92]
!62 = metadata !{i32 786688, metadata !4, metadata !"X", metadata !5, i32 92, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [X] [line 92]
!63 = metadata !{i32 786688, metadata !4, metadata !"Y", metadata !5, i32 92, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Y] [line 92]
!64 = metadata !{i32 786688, metadata !4, metadata !"Z", metadata !5, i32 92, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Z] [line 92]
!65 = metadata !{i32 786688, metadata !4, metadata !"LOOP", metadata !5, i32 93, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [LOOP] [line 93]
!66 = metadata !{i32 93, i32 0, metadata !4, null}
!67 = metadata !{i32 786688, metadata !4, metadata !"II", metadata !5, i32 94, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [II] [line 94]
!68 = metadata !{i32 94, i32 0, metadata !4, null}
!69 = metadata !{i32 786688, metadata !4, metadata !"JJ", metadata !5, i32 94, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [JJ] [line 94]
!70 = metadata !{i32 786688, metadata !4, metadata !"loopstart", metadata !5, i32 97, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [loopstart] [line 97]
!71 = metadata !{i32 97, i32 0, metadata !4, null}
!72 = metadata !{i32 786688, metadata !4, metadata !"startsec", metadata !5, i32 98, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [startsec] [line 98]
!73 = metadata !{i32 98, i32 0, metadata !4, null}
!74 = metadata !{i32 786688, metadata !4, metadata !"finisec", metadata !5, i32 98, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [finisec] [line 98]
!75 = metadata !{i32 786688, metadata !4, metadata !"KIPS", metadata !5, i32 99, metadata !76, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [KIPS] [line 99]
!76 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!77 = metadata !{i32 99, i32 0, metadata !4, null}
!78 = metadata !{i32 786688, metadata !4, metadata !"continuous", metadata !5, i32 100, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [continuous] [line 100]
!79 = metadata !{i32 100, i32 0, metadata !4, null}
!80 = metadata !{i32 105, i32 0, metadata !4, null}
!81 = metadata !{i32 107, i32 0, metadata !4, null}
!82 = metadata !{i32 109, i32 0, metadata !4, null}
!83 = metadata !{i32 110, i32 0, metadata !4, null}
!84 = metadata !{i32 111, i32 0, metadata !85, null}
!85 = metadata !{i32 786443, metadata !1, metadata !86, i32 111, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!86 = metadata !{i32 786443, metadata !1, metadata !4, i32 110, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!87 = metadata !{i32 112, i32 0, metadata !88, null}
!88 = metadata !{i32 786443, metadata !1, metadata !85, i32 111, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!89 = metadata !{i32 113, i32 0, metadata !88, null}
!90 = metadata !{i32 113, i32 0, metadata !91, null}
!91 = metadata !{i32 786443, metadata !1, metadata !85, i32 113, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!92 = metadata !{i32 114, i32 0, metadata !93, null}
!93 = metadata !{i32 786443, metadata !1, metadata !91, i32 113, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!94 = metadata !{i32 115, i32 0, metadata !93, null}
!95 = metadata !{i32 116, i32 0, metadata !96, null}
!96 = metadata !{i32 786443, metadata !1, metadata !91, i32 115, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!97 = metadata !{i32 117, i32 0, metadata !96, null}
!98 = metadata !{i32 119, i32 0, metadata !86, null}
!99 = metadata !{i32 120, i32 0, metadata !86, null}
!100 = metadata !{i32 128, i32 0, metadata !4, null}
!101 = metadata !{i32 135, i32 0, metadata !4, null}
!102 = metadata !{i32 136, i32 0, metadata !4, null}
!103 = metadata !{i32 137, i32 0, metadata !4, null}
!104 = metadata !{i32 146, i32 0, metadata !4, null}
!105 = metadata !{i32 147, i32 0, metadata !4, null}
!106 = metadata !{i32 149, i32 0, metadata !4, null}
!107 = metadata !{i32 152, i32 0, metadata !4, null}
!108 = metadata !{i32 153, i32 0, metadata !4, null}
!109 = metadata !{i32 154, i32 0, metadata !4, null}
!110 = metadata !{i32 155, i32 0, metadata !4, null}
!111 = metadata !{i32 156, i32 0, metadata !4, null}
!112 = metadata !{i32 157, i32 0, metadata !4, null}
!113 = metadata !{i32 158, i32 0, metadata !4, null}
!114 = metadata !{i32 159, i32 0, metadata !4, null}
!115 = metadata !{i32 160, i32 0, metadata !4, null}
!116 = metadata !{i32 161, i32 0, metadata !4, null}
!117 = metadata !{i32 167, i32 0, metadata !4, null}
!118 = metadata !{i32 168, i32 0, metadata !4, null}
!119 = metadata !{i32 169, i32 0, metadata !4, null}
!120 = metadata !{i32 170, i32 0, metadata !4, null}
!121 = metadata !{i32 172, i32 0, metadata !122, null}
!122 = metadata !{i32 786443, metadata !1, metadata !4, i32 172, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!123 = metadata !{i32 173, i32 0, metadata !124, null}
!124 = metadata !{i32 786443, metadata !1, metadata !122, i32 172, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!125 = metadata !{i32 174, i32 0, metadata !124, null}
!126 = metadata !{i32 175, i32 0, metadata !124, null}
!127 = metadata !{i32 176, i32 0, metadata !124, null}
!128 = metadata !{i32 177, i32 0, metadata !124, null}
!129 = metadata !{i32 179, i32 0, metadata !130, null}
!130 = metadata !{i32 786443, metadata !1, metadata !4, i32 179, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!131 = metadata !{i32 187, i32 0, metadata !4, null}
!132 = metadata !{i32 188, i32 0, metadata !4, null}
!133 = metadata !{i32 189, i32 0, metadata !4, null}
!134 = metadata !{i32 190, i32 0, metadata !4, null}
!135 = metadata !{i32 192, i32 0, metadata !136, null}
!136 = metadata !{i32 786443, metadata !1, metadata !4, i32 192, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!137 = metadata !{i32 193, i32 0, metadata !138, null}
!138 = metadata !{i32 786443, metadata !1, metadata !136, i32 192, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!139 = metadata !{i32 194, i32 0, metadata !138, null}
!140 = metadata !{i32 195, i32 0, metadata !138, null}
!141 = metadata !{i32 196, i32 0, metadata !138, null}
!142 = metadata !{i32 197, i32 0, metadata !138, null}
!143 = metadata !{i32 200, i32 0, metadata !144, null}
!144 = metadata !{i32 786443, metadata !1, metadata !4, i32 200, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!145 = metadata !{i32 208, i32 0, metadata !146, null}
!146 = metadata !{i32 786443, metadata !1, metadata !4, i32 208, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!147 = metadata !{i32 209, i32 0, metadata !146, null}
!148 = metadata !{i32 212, i32 0, metadata !149, null}
!149 = metadata !{i32 786443, metadata !1, metadata !4, i32 212, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!150 = metadata !{i32 220, i32 0, metadata !4, null}
!151 = metadata !{i32 221, i32 0, metadata !152, null}
!152 = metadata !{i32 786443, metadata !1, metadata !4, i32 221, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!153 = metadata !{i32 222, i32 0, metadata !154, null}
!154 = metadata !{i32 786443, metadata !1, metadata !155, i32 222, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!155 = metadata !{i32 786443, metadata !1, metadata !152, i32 221, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!156 = metadata !{i32 223, i32 0, metadata !154, null}
!157 = metadata !{i32 225, i32 0, metadata !154, null}
!158 = metadata !{i32 227, i32 0, metadata !159, null}
!159 = metadata !{i32 786443, metadata !1, metadata !155, i32 227, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!160 = metadata !{i32 228, i32 0, metadata !159, null}
!161 = metadata !{i32 230, i32 0, metadata !159, null}
!162 = metadata !{i32 232, i32 0, metadata !163, null}
!163 = metadata !{i32 786443, metadata !1, metadata !155, i32 232, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!164 = metadata !{i32 233, i32 0, metadata !163, null}
!165 = metadata !{i32 235, i32 0, metadata !163, null}
!166 = metadata !{i32 236, i32 0, metadata !155, null}
!167 = metadata !{i32 239, i32 0, metadata !168, null}
!168 = metadata !{i32 786443, metadata !1, metadata !4, i32 239, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!169 = metadata !{i32 249, i32 0, metadata !4, null}
!170 = metadata !{i32 250, i32 0, metadata !4, null}
!171 = metadata !{i32 251, i32 0, metadata !4, null}
!172 = metadata !{i32 253, i32 0, metadata !173, null}
!173 = metadata !{i32 786443, metadata !1, metadata !4, i32 253, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!174 = metadata !{i32 254, i32 0, metadata !175, null}
!175 = metadata !{i32 786443, metadata !1, metadata !173, i32 253, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!176 = metadata !{i32 255, i32 0, metadata !175, null}
!177 = metadata !{i32 256, i32 0, metadata !175, null}
!178 = metadata !{i32 257, i32 0, metadata !175, null}
!179 = metadata !{i32 258, i32 0, metadata !175, null}
!180 = metadata !{i32 259, i32 0, metadata !175, null}
!181 = metadata !{i32 262, i32 0, metadata !182, null}
!182 = metadata !{i32 786443, metadata !1, metadata !4, i32 262, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!183 = metadata !{i32 270, i32 0, metadata !4, null}
!184 = metadata !{i32 271, i32 0, metadata !4, null}
!185 = metadata !{i32 273, i32 0, metadata !186, null}
!186 = metadata !{i32 786443, metadata !1, metadata !4, i32 273, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!187 = metadata !{i32 274, i32 0, metadata !188, null}
!188 = metadata !{i32 786443, metadata !1, metadata !186, i32 273, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!189 = metadata !{i32 275, i32 0, metadata !188, null}
!190 = metadata !{i32 276, i32 0, metadata !188, null}
!191 = metadata !{i32 279, i32 0, metadata !192, null}
!192 = metadata !{i32 786443, metadata !1, metadata !4, i32 279, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!193 = metadata !{i32 287, i32 0, metadata !4, null}
!194 = metadata !{i32 288, i32 0, metadata !4, null}
!195 = metadata !{i32 289, i32 0, metadata !4, null}
!196 = metadata !{i32 291, i32 0, metadata !197, null}
!197 = metadata !{i32 786443, metadata !1, metadata !4, i32 291, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!198 = metadata !{i32 292, i32 0, metadata !197, null}
!199 = metadata !{i32 295, i32 0, metadata !200, null}
!200 = metadata !{i32 786443, metadata !1, metadata !4, i32 295, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!201 = metadata !{i32 303, i32 0, metadata !4, null}
!202 = metadata !{i32 304, i32 0, metadata !4, null}
!203 = metadata !{i32 305, i32 0, metadata !4, null}
!204 = metadata !{i32 306, i32 0, metadata !4, null}
!205 = metadata !{i32 307, i32 0, metadata !4, null}
!206 = metadata !{i32 308, i32 0, metadata !4, null}
!207 = metadata !{i32 310, i32 0, metadata !208, null}
!208 = metadata !{i32 786443, metadata !1, metadata !4, i32 310, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!209 = metadata !{i32 311, i32 0, metadata !208, null}
!210 = metadata !{i32 314, i32 0, metadata !211, null}
!211 = metadata !{i32 786443, metadata !1, metadata !4, i32 314, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!212 = metadata !{i32 322, i32 0, metadata !4, null}
!213 = metadata !{i32 323, i32 0, metadata !4, null}
!214 = metadata !{i32 325, i32 0, metadata !215, null}
!215 = metadata !{i32 786443, metadata !1, metadata !4, i32 325, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!216 = metadata !{i32 326, i32 0, metadata !217, null}
!217 = metadata !{i32 786443, metadata !1, metadata !215, i32 325, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!218 = metadata !{i32 327, i32 0, metadata !217, null}
!219 = metadata !{i32 328, i32 0, metadata !217, null}
!220 = metadata !{i32 329, i32 0, metadata !217, null}
!221 = metadata !{i32 330, i32 0, metadata !217, null}
!222 = metadata !{i32 333, i32 0, metadata !223, null}
!223 = metadata !{i32 786443, metadata !1, metadata !4, i32 333, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!224 = metadata !{i32 341, i32 0, metadata !4, null}
!225 = metadata !{i32 343, i32 0, metadata !226, null}
!226 = metadata !{i32 786443, metadata !1, metadata !4, i32 343, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!227 = metadata !{i32 344, i32 0, metadata !226, null}
!228 = metadata !{i32 347, i32 0, metadata !229, null}
!229 = metadata !{i32 786443, metadata !1, metadata !4, i32 347, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!230 = metadata !{i32 355, i32 0, metadata !231, null}
!231 = metadata !{i32 786443, metadata !1, metadata !4, i32 355, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!232 = metadata !{i32 356, i32 0, metadata !231, null}
!233 = metadata !{i32 363, i32 0, metadata !4, null}
!234 = metadata !{i32 374, i32 0, metadata !4, null}
!235 = metadata !{i32 390, i32 0, metadata !236, null}
!236 = metadata !{i32 786443, metadata !1, metadata !4, i32 390, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!237 = metadata !{i32 391, i32 0, metadata !236, null}
!238 = metadata !{i32 393, i32 0, metadata !4, null}
!239 = metadata !{i32 394, i32 0, metadata !4, null}
!240 = metadata !{i32 786689, metadata !23, metadata !"N", metadata !5, i32 16777650, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 434]
!241 = metadata !{i32 434, i32 0, metadata !23, null}
!242 = metadata !{i32 786689, metadata !23, metadata !"J", metadata !5, i32 33554866, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [J] [line 434]
!243 = metadata !{i32 786689, metadata !23, metadata !"K", metadata !5, i32 50332082, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [K] [line 434]
!244 = metadata !{i32 786689, metadata !23, metadata !"X1", metadata !5, i32 67109298, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!245 = metadata !{i32 786689, metadata !23, metadata !"X2", metadata !5, i32 83886514, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!246 = metadata !{i32 786689, metadata !23, metadata !"X3", metadata !5, i32 100663730, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!247 = metadata !{i32 786689, metadata !23, metadata !"X4", metadata !5, i32 117440946, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!248 = metadata !{i32 436, i32 0, metadata !23, null}
!249 = metadata !{i32 438, i32 0, metadata !23, null}
!250 = metadata !{i32 786689, metadata !12, metadata !"E", metadata !5, i32 16777613, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [E] [line 397]
!251 = metadata !{i32 397, i32 0, metadata !12, null}
!252 = metadata !{i32 399, i32 0, metadata !12, null}
!253 = metadata !{i32 402, i32 0, metadata !12, null}
!254 = metadata !{i32 403, i32 0, metadata !12, null}
!255 = metadata !{i32 404, i32 0, metadata !12, null}
!256 = metadata !{i32 405, i32 0, metadata !12, null}
!257 = metadata !{i32 406, i32 0, metadata !12, null}
!258 = metadata !{i32 408, i32 0, metadata !259, null}
!259 = metadata !{i32 786443, metadata !1, metadata !12, i32 408, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/whetstone.c]
!260 = metadata !{i32 409, i32 0, metadata !259, null}
!261 = metadata !{i32 410, i32 0, metadata !12, null}
!262 = metadata !{i32 786689, metadata !20, metadata !"X", metadata !5, i32 16777637, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [X] [line 421]
!263 = metadata !{i32 421, i32 0, metadata !20, null}
!264 = metadata !{i32 786689, metadata !20, metadata !"Y", metadata !5, i32 33554853, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Y] [line 421]
!265 = metadata !{i32 786689, metadata !20, metadata !"Z", metadata !5, i32 50332069, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Z] [line 421]
!266 = metadata !{i32 786688, metadata !20, metadata !"X1", metadata !5, i32 423, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [X1] [line 423]
!267 = metadata !{i32 423, i32 0, metadata !20, null}
!268 = metadata !{i32 786688, metadata !20, metadata !"Y1", metadata !5, i32 423, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Y1] [line 423]
!269 = metadata !{i32 425, i32 0, metadata !20, null}
!270 = metadata !{i32 426, i32 0, metadata !20, null}
!271 = metadata !{i32 427, i32 0, metadata !20, null}
!272 = metadata !{i32 428, i32 0, metadata !20, null}
!273 = metadata !{i32 429, i32 0, metadata !20, null}
!274 = metadata !{i32 430, i32 0, metadata !20, null}
!275 = metadata !{i32 415, i32 0, metadata !17, null}
!276 = metadata !{i32 416, i32 0, metadata !17, null}
!277 = metadata !{i32 417, i32 0, metadata !17, null}
!278 = metadata !{i32 418, i32 0, metadata !17, null}
