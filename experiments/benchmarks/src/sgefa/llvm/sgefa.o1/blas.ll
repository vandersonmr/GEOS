; ModuleID = 'blas.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind readonly uwtable
define i32 @isamax(i32 %n, float* nocapture readonly %sx, i32 %incx) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !14, metadata !131), !dbg !132
  tail call void @llvm.dbg.value(metadata float* %sx, i64 0, metadata !15, metadata !131), !dbg !133
  tail call void @llvm.dbg.value(metadata i32 %incx, i64 0, metadata !16, metadata !131), !dbg !134
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !17, metadata !131), !dbg !135
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !19, metadata !131), !dbg !136
  %cmp = icmp slt i32 %n, 2, !dbg !137
  br i1 %cmp, label %return, label %if.end, !dbg !139

if.end:                                           ; preds = %entry
  %cmp1 = icmp eq i32 %incx, 1, !dbg !140
  br i1 %cmp1, label %if.end36, label %if.then2, !dbg !142

if.then2:                                         ; preds = %if.end
  %cmp3 = icmp slt i32 %incx, 0, !dbg !143
  br i1 %cmp3, label %if.then4, label %if.end6, !dbg !146

if.then4:                                         ; preds = %if.then2
  %add = sub i32 1, %n, !dbg !147
  %mul = mul nsw i32 %add, %incx, !dbg !148
  %add5 = add nsw i32 %mul, 1, !dbg !148
  %idx.ext = sext i32 %add5 to i64, !dbg !149
  %add.ptr = getelementptr inbounds float* %sx, i64 %idx.ext, !dbg !149
  tail call void @llvm.dbg.value(metadata float* %add.ptr, i64 0, metadata !15, metadata !131), !dbg !133
  br label %if.end6, !dbg !150

if.end6:                                          ; preds = %if.then4, %if.then2
  %sx.addr.0 = phi float* [ %add.ptr, %if.then4 ], [ %sx, %if.then2 ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !19, metadata !131), !dbg !136
  %0 = load float* %sx.addr.0, align 4, !dbg !151, !tbaa !152
  %cmp7 = fcmp ogt float %0, 0.000000e+00, !dbg !151
  br i1 %cmp7, label %for.body.lr.ph, label %cond.false, !dbg !151

cond.false:                                       ; preds = %if.end6
  %sub9 = fsub float -0.000000e+00, %0, !dbg !156
  br label %for.body.lr.ph, !dbg !156

for.body.lr.ph:                                   ; preds = %cond.false, %if.end6
  %cond = phi float [ %sub9, %cond.false ], [ %0, %if.end6 ], !dbg !151
  tail call void @llvm.dbg.value(metadata float %cond, i64 0, metadata !17, metadata !131), !dbg !135
  %idx.ext10 = sext i32 %incx to i64, !dbg !158
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !18, metadata !131), !dbg !159
  %1 = add i32 %n, -1, !dbg !160
  br label %for.body, !dbg !160

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %sx.addr.0.pn = phi float* [ %sx.addr.0, %for.body.lr.ph ], [ %sx.addr.1116, %for.inc ]
  %istmp.0115 = phi i32 [ 0, %for.body.lr.ph ], [ %istmp.1, %for.inc ]
  %i.0114 = phi i32 [ 1, %for.body.lr.ph ], [ %inc, %for.inc ]
  %smax.0113 = phi float [ %cond, %for.body.lr.ph ], [ %smax.1, %for.inc ]
  %sx.addr.1116 = getelementptr inbounds float* %sx.addr.0.pn, i64 %idx.ext10, !dbg !158
  %2 = load float* %sx.addr.1116, align 4, !dbg !162, !tbaa !152
  %cmp15 = fcmp ogt float %2, 0.000000e+00, !dbg !162
  br i1 %cmp15, label %cond.end20, label %cond.false18, !dbg !162

cond.false18:                                     ; preds = %for.body
  %sub19 = fsub float -0.000000e+00, %2, !dbg !165
  br label %cond.end20, !dbg !165

cond.end20:                                       ; preds = %for.body, %cond.false18
  %cond21 = phi float [ %sub19, %cond.false18 ], [ %2, %for.body ], !dbg !162
  %cmp22 = fcmp ogt float %cond21, %smax.0113, !dbg !162
  br i1 %cmp22, label %if.then24, label %for.inc, !dbg !167

if.then24:                                        ; preds = %cond.end20
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !19, metadata !131), !dbg !136
  %3 = load float* %sx.addr.1116, align 4, !dbg !168, !tbaa !152
  %cmp26 = fcmp ogt float %3, 0.000000e+00, !dbg !168
  br i1 %cmp26, label %for.inc, label %cond.false29, !dbg !168

cond.false29:                                     ; preds = %if.then24
  %sub30 = fsub float -0.000000e+00, %3, !dbg !170
  br label %for.inc, !dbg !170

for.inc:                                          ; preds = %cond.false29, %if.then24, %cond.end20
  %smax.1 = phi float [ %smax.0113, %cond.end20 ], [ %sub30, %cond.false29 ], [ %3, %if.then24 ]
  %istmp.1 = phi i32 [ %istmp.0115, %cond.end20 ], [ %i.0114, %cond.false29 ], [ %i.0114, %if.then24 ]
  %inc = add nuw nsw i32 %i.0114, 1, !dbg !172
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !18, metadata !131), !dbg !159
  %exitcond118 = icmp eq i32 %i.0114, %1, !dbg !160
  br i1 %exitcond118, label %return, label %for.body, !dbg !160

if.end36:                                         ; preds = %if.end
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !19, metadata !131), !dbg !136
  %4 = load float* %sx, align 4, !dbg !173, !tbaa !152
  %cmp38 = fcmp ogt float %4, 0.000000e+00, !dbg !173
  br i1 %cmp38, label %for.body48.lr.ph, label %cond.false41, !dbg !173

cond.false41:                                     ; preds = %if.end36
  %sub42 = fsub float -0.000000e+00, %4, !dbg !174
  br label %for.body48.lr.ph, !dbg !174

for.body48.lr.ph:                                 ; preds = %cond.false41, %if.end36
  %smax.2.ph = phi float [ %sub42, %cond.false41 ], [ %4, %if.end36 ]
  %5 = add i32 %n, -1, !dbg !176
  br label %for.body48, !dbg !176

for.body48:                                       ; preds = %for.inc69, %for.body48.lr.ph
  %sx.pn = phi float* [ %sx, %for.body48.lr.ph ], [ %sx.addr.2110, %for.inc69 ]
  %istmp.2109 = phi i32 [ 0, %for.body48.lr.ph ], [ %istmp.3, %for.inc69 ]
  %i.1108 = phi i32 [ 1, %for.body48.lr.ph ], [ %inc70, %for.inc69 ]
  %smax.2107 = phi float [ %smax.2.ph, %for.body48.lr.ph ], [ %smax.3, %for.inc69 ]
  %sx.addr.2110 = getelementptr inbounds float* %sx.pn, i64 1, !dbg !178
  %6 = load float* %sx.addr.2110, align 4, !dbg !179, !tbaa !152
  %cmp50 = fcmp ogt float %6, 0.000000e+00, !dbg !179
  br i1 %cmp50, label %cond.end55, label %cond.false53, !dbg !179

cond.false53:                                     ; preds = %for.body48
  %sub54 = fsub float -0.000000e+00, %6, !dbg !182
  br label %cond.end55, !dbg !182

cond.end55:                                       ; preds = %for.body48, %cond.false53
  %cond56 = phi float [ %sub54, %cond.false53 ], [ %6, %for.body48 ], !dbg !179
  %cmp57 = fcmp ogt float %cond56, %smax.2107, !dbg !179
  br i1 %cmp57, label %if.then59, label %for.inc69, !dbg !184

if.then59:                                        ; preds = %cond.end55
  tail call void @llvm.dbg.value(metadata i32 %inc70, i64 0, metadata !19, metadata !131), !dbg !136
  %7 = load float* %sx.addr.2110, align 4, !dbg !185, !tbaa !152
  %cmp61 = fcmp ogt float %7, 0.000000e+00, !dbg !185
  br i1 %cmp61, label %for.inc69, label %cond.false64, !dbg !185

cond.false64:                                     ; preds = %if.then59
  %sub65 = fsub float -0.000000e+00, %7, !dbg !187
  br label %for.inc69, !dbg !187

for.inc69:                                        ; preds = %cond.false64, %if.then59, %cond.end55
  %smax.3 = phi float [ %smax.2107, %cond.end55 ], [ %sub65, %cond.false64 ], [ %7, %if.then59 ]
  %istmp.3 = phi i32 [ %istmp.2109, %cond.end55 ], [ %i.1108, %cond.false64 ], [ %i.1108, %if.then59 ]
  %inc70 = add nuw nsw i32 %i.1108, 1, !dbg !189
  tail call void @llvm.dbg.value(metadata i32 %inc70, i64 0, metadata !18, metadata !131), !dbg !159
  %exitcond = icmp eq i32 %i.1108, %5, !dbg !176
  br i1 %exitcond, label %return, label %for.body48, !dbg !176

return:                                           ; preds = %for.inc, %for.inc69, %entry
  %retval.0 = phi i32 [ 0, %entry ], [ %istmp.3, %for.inc69 ], [ %istmp.1, %for.inc ]
  ret i32 %retval.0, !dbg !190
}

; Function Attrs: nounwind uwtable
define void @saxpy(i32 %n, double, float* nocapture readonly %sx, i32 %incx, float* nocapture %sy, i32 %incy) #1 {
entry:
  %sa = fptrunc double %0 to float
  tail call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !24, metadata !131), !dbg !191
  tail call void @llvm.dbg.value(metadata float %sa, i64 0, metadata !25, metadata !131), !dbg !192
  tail call void @llvm.dbg.value(metadata float* %sx, i64 0, metadata !26, metadata !131), !dbg !193
  tail call void @llvm.dbg.value(metadata i32 %incx, i64 0, metadata !27, metadata !131), !dbg !194
  tail call void @llvm.dbg.value(metadata float* %sy, i64 0, metadata !28, metadata !131), !dbg !195
  tail call void @llvm.dbg.value(metadata i32 %incy, i64 0, metadata !29, metadata !131), !dbg !196
  %cmp = icmp slt i32 %n, 1, !dbg !197
  %cmp1 = fcmp oeq float %sa, 0.000000e+00, !dbg !199
  %or.cond = or i1 %cmp, %cmp1, !dbg !201
  br i1 %or.cond, label %for.end60, label %if.end, !dbg !201

if.end:                                           ; preds = %entry
  %cmp3 = icmp eq i32 %incx, %incy, !dbg !202
  br i1 %cmp3, label %if.then5, label %if.end28, !dbg !204

if.then5:                                         ; preds = %if.end
  %cmp6 = icmp eq i32 %incx, 1, !dbg !205
  br i1 %cmp6, label %for.cond.preheader, label %if.end12, !dbg !208

for.cond.preheader:                               ; preds = %if.then5
  %cmp998 = icmp sgt i32 %n, 0, !dbg !209
  br i1 %cmp998, label %for.body.lr.ph, label %for.end60, !dbg !213

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %1 = add i32 %n, -1, !dbg !213
  br label %for.body, !dbg !213

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %i.0101 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %sx.addr.0100 = phi float* [ %sx, %for.body.lr.ph ], [ %incdec.ptr11, %for.body ]
  %sy.addr.099 = phi float* [ %sy, %for.body.lr.ph ], [ %incdec.ptr, %for.body ]
  %2 = load float* %sx.addr.0100, align 4, !dbg !214, !tbaa !152
  %mul = fmul float %sa, %2, !dbg !215
  %3 = load float* %sy.addr.099, align 4, !dbg !216, !tbaa !152
  %add = fadd float %3, %mul, !dbg !216
  store float %add, float* %sy.addr.099, align 4, !dbg !216, !tbaa !152
  %inc = add nuw nsw i32 %i.0101, 1, !dbg !217
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !30, metadata !131), !dbg !218
  %incdec.ptr = getelementptr inbounds float* %sy.addr.099, i64 1, !dbg !219
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !28, metadata !131), !dbg !195
  %incdec.ptr11 = getelementptr inbounds float* %sx.addr.0100, i64 1, !dbg !220
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr11, i64 0, metadata !26, metadata !131), !dbg !193
  %exitcond = icmp eq i32 %i.0101, %1, !dbg !213
  br i1 %exitcond, label %for.end60, label %for.body, !dbg !213

if.end12:                                         ; preds = %if.then5
  %cmp13 = icmp sgt i32 %incx, 0, !dbg !221
  br i1 %cmp13, label %for.cond16.preheader, label %if.end28, !dbg !223

for.cond16.preheader:                             ; preds = %if.end12
  %cmp17102 = icmp sgt i32 %n, 0, !dbg !224
  br i1 %cmp17102, label %for.body19.lr.ph, label %for.end60, !dbg !228

for.body19.lr.ph:                                 ; preds = %for.cond16.preheader
  %idx.ext = sext i32 %incx to i64, !dbg !229
  %4 = add i32 %n, -1, !dbg !228
  br label %for.body19, !dbg !228

for.body19:                                       ; preds = %for.body19, %for.body19.lr.ph
  %i.1105 = phi i32 [ 0, %for.body19.lr.ph ], [ %inc23, %for.body19 ]
  %sx.addr.1104 = phi float* [ %sx, %for.body19.lr.ph ], [ %add.ptr, %for.body19 ]
  %sy.addr.1103 = phi float* [ %sy, %for.body19.lr.ph ], [ %add.ptr25, %for.body19 ]
  %5 = load float* %sx.addr.1104, align 4, !dbg !230, !tbaa !152
  %mul20 = fmul float %sa, %5, !dbg !231
  %6 = load float* %sy.addr.1103, align 4, !dbg !232, !tbaa !152
  %add21 = fadd float %6, %mul20, !dbg !232
  store float %add21, float* %sy.addr.1103, align 4, !dbg !232, !tbaa !152
  %inc23 = add nuw nsw i32 %i.1105, 1, !dbg !233
  tail call void @llvm.dbg.value(metadata i32 %inc23, i64 0, metadata !30, metadata !131), !dbg !218
  %add.ptr = getelementptr inbounds float* %sx.addr.1104, i64 %idx.ext, !dbg !229
  tail call void @llvm.dbg.value(metadata float* %add.ptr, i64 0, metadata !26, metadata !131), !dbg !193
  %add.ptr25 = getelementptr inbounds float* %sy.addr.1103, i64 %idx.ext, !dbg !234
  tail call void @llvm.dbg.value(metadata float* %add.ptr25, i64 0, metadata !28, metadata !131), !dbg !195
  %exitcond110 = icmp eq i32 %i.1105, %4, !dbg !228
  br i1 %exitcond110, label %for.end60, label %for.body19, !dbg !228

if.end28:                                         ; preds = %if.end12, %if.end
  %cmp29 = icmp slt i32 %incx, 0, !dbg !235
  br i1 %cmp29, label %if.then31, label %if.end37, !dbg !237

if.then31:                                        ; preds = %if.end28
  %add32 = sub i32 1, %n, !dbg !238
  %mul33 = mul nsw i32 %add32, %incx, !dbg !239
  %add34 = add nsw i32 %mul33, 1, !dbg !239
  %idx.ext35 = sext i32 %add34 to i64, !dbg !240
  %add.ptr36 = getelementptr inbounds float* %sx, i64 %idx.ext35, !dbg !240
  tail call void @llvm.dbg.value(metadata float* %add.ptr36, i64 0, metadata !26, metadata !131), !dbg !193
  br label %if.end37, !dbg !240

if.end37:                                         ; preds = %if.then31, %if.end28
  %sx.addr.2 = phi float* [ %add.ptr36, %if.then31 ], [ %sx, %if.end28 ]
  %cmp38 = icmp slt i32 %incy, 0, !dbg !241
  br i1 %cmp38, label %if.then40, label %for.cond48.preheader, !dbg !243

if.then40:                                        ; preds = %if.end37
  %add42 = sub i32 1, %n, !dbg !244
  %mul43 = mul nsw i32 %add42, %incy, !dbg !245
  %add44 = add nsw i32 %mul43, 1, !dbg !245
  %idx.ext45 = sext i32 %add44 to i64, !dbg !246
  %add.ptr46 = getelementptr inbounds float* %sy, i64 %idx.ext45, !dbg !246
  tail call void @llvm.dbg.value(metadata float* %add.ptr46, i64 0, metadata !28, metadata !131), !dbg !195
  br label %for.cond48.preheader, !dbg !246

for.cond48.preheader:                             ; preds = %if.then40, %if.end37
  %sy.addr.3.ph = phi float* [ %sy, %if.end37 ], [ %add.ptr46, %if.then40 ]
  %cmp49106 = icmp sgt i32 %n, 0, !dbg !247
  br i1 %cmp49106, label %for.body51.lr.ph, label %for.end60, !dbg !250

for.body51.lr.ph:                                 ; preds = %for.cond48.preheader
  %idx.ext56 = sext i32 %incx to i64, !dbg !251
  %idx.ext58 = sext i32 %incy to i64, !dbg !252
  %7 = add i32 %n, -1, !dbg !250
  br label %for.body51, !dbg !250

for.body51:                                       ; preds = %for.body51, %for.body51.lr.ph
  %i.2109 = phi i32 [ 0, %for.body51.lr.ph ], [ %inc55, %for.body51 ]
  %sx.addr.3108 = phi float* [ %sx.addr.2, %for.body51.lr.ph ], [ %add.ptr57, %for.body51 ]
  %sy.addr.3107 = phi float* [ %sy.addr.3.ph, %for.body51.lr.ph ], [ %add.ptr59, %for.body51 ]
  %8 = load float* %sx.addr.3108, align 4, !dbg !253, !tbaa !152
  %mul52 = fmul float %sa, %8, !dbg !254
  %9 = load float* %sy.addr.3107, align 4, !dbg !255, !tbaa !152
  %add53 = fadd float %9, %mul52, !dbg !255
  store float %add53, float* %sy.addr.3107, align 4, !dbg !255, !tbaa !152
  %inc55 = add nuw nsw i32 %i.2109, 1, !dbg !256
  tail call void @llvm.dbg.value(metadata i32 %inc55, i64 0, metadata !30, metadata !131), !dbg !218
  %add.ptr57 = getelementptr inbounds float* %sx.addr.3108, i64 %idx.ext56, !dbg !251
  tail call void @llvm.dbg.value(metadata float* %add.ptr57, i64 0, metadata !26, metadata !131), !dbg !193
  %add.ptr59 = getelementptr inbounds float* %sy.addr.3107, i64 %idx.ext58, !dbg !252
  tail call void @llvm.dbg.value(metadata float* %add.ptr59, i64 0, metadata !28, metadata !131), !dbg !195
  %exitcond111 = icmp eq i32 %i.2109, %7, !dbg !250
  br i1 %exitcond111, label %for.end60, label %for.body51, !dbg !250

for.end60:                                        ; preds = %for.body51, %for.body19, %for.body, %for.cond48.preheader, %for.cond16.preheader, %for.cond.preheader, %entry
  ret void, !dbg !257
}

; Function Attrs: nounwind uwtable
define void @saxpyx(i32 %n, double, float* nocapture %sx, i32 %incx, float* nocapture readonly %sy, i32 %incy) #1 {
entry:
  %sa = fptrunc double %0 to float
  tail call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !33, metadata !131), !dbg !258
  tail call void @llvm.dbg.value(metadata float %sa, i64 0, metadata !34, metadata !131), !dbg !259
  tail call void @llvm.dbg.value(metadata float* %sx, i64 0, metadata !35, metadata !131), !dbg !260
  tail call void @llvm.dbg.value(metadata i32 %incx, i64 0, metadata !36, metadata !131), !dbg !261
  tail call void @llvm.dbg.value(metadata float* %sy, i64 0, metadata !37, metadata !131), !dbg !262
  tail call void @llvm.dbg.value(metadata i32 %incy, i64 0, metadata !38, metadata !131), !dbg !263
  %cmp = icmp slt i32 %n, 1, !dbg !264
  %cmp1 = fcmp oeq float %sa, 0.000000e+00, !dbg !266
  %or.cond = or i1 %cmp, %cmp1, !dbg !268
  br i1 %or.cond, label %for.end60, label %if.end, !dbg !268

if.end:                                           ; preds = %entry
  %cmp3 = icmp eq i32 %incx, %incy, !dbg !269
  br i1 %cmp3, label %if.then5, label %if.end28, !dbg !271

if.then5:                                         ; preds = %if.end
  %cmp6 = icmp eq i32 %incx, 1, !dbg !272
  br i1 %cmp6, label %for.cond.preheader, label %if.end12, !dbg !275

for.cond.preheader:                               ; preds = %if.then5
  %cmp9101 = icmp sgt i32 %n, 0, !dbg !276
  br i1 %cmp9101, label %for.body.lr.ph, label %for.end60, !dbg !280

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %1 = add i32 %n, -1, !dbg !280
  br label %for.body, !dbg !280

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %i.0104 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %sx.addr.0103 = phi float* [ %sx, %for.body.lr.ph ], [ %incdec.ptr, %for.body ]
  %sy.addr.0102 = phi float* [ %sy, %for.body.lr.ph ], [ %incdec.ptr11, %for.body ]
  %2 = load float* %sy.addr.0102, align 4, !dbg !281, !tbaa !152
  %3 = load float* %sx.addr.0103, align 4, !dbg !282, !tbaa !152
  %mul = fmul float %sa, %3, !dbg !283
  %add = fadd float %2, %mul, !dbg !281
  store float %add, float* %sx.addr.0103, align 4, !dbg !284, !tbaa !152
  %inc = add nuw nsw i32 %i.0104, 1, !dbg !285
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !39, metadata !131), !dbg !286
  %incdec.ptr = getelementptr inbounds float* %sx.addr.0103, i64 1, !dbg !287
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !35, metadata !131), !dbg !260
  %incdec.ptr11 = getelementptr inbounds float* %sy.addr.0102, i64 1, !dbg !288
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr11, i64 0, metadata !37, metadata !131), !dbg !262
  %exitcond = icmp eq i32 %i.0104, %1, !dbg !280
  br i1 %exitcond, label %for.end60, label %for.body, !dbg !280

if.end12:                                         ; preds = %if.then5
  %cmp13 = icmp sgt i32 %incx, 0, !dbg !289
  br i1 %cmp13, label %for.cond16.preheader, label %if.end28, !dbg !291

for.cond16.preheader:                             ; preds = %if.end12
  %cmp17105 = icmp sgt i32 %n, 0, !dbg !292
  br i1 %cmp17105, label %for.body19.lr.ph, label %for.end60, !dbg !296

for.body19.lr.ph:                                 ; preds = %for.cond16.preheader
  %idx.ext = sext i32 %incx to i64, !dbg !297
  %4 = add i32 %n, -1, !dbg !296
  br label %for.body19, !dbg !296

for.body19:                                       ; preds = %for.body19, %for.body19.lr.ph
  %i.1108 = phi i32 [ 0, %for.body19.lr.ph ], [ %inc23, %for.body19 ]
  %sx.addr.1107 = phi float* [ %sx, %for.body19.lr.ph ], [ %add.ptr, %for.body19 ]
  %sy.addr.1106 = phi float* [ %sy, %for.body19.lr.ph ], [ %add.ptr25, %for.body19 ]
  %5 = load float* %sy.addr.1106, align 4, !dbg !298, !tbaa !152
  %6 = load float* %sx.addr.1107, align 4, !dbg !299, !tbaa !152
  %mul20 = fmul float %sa, %6, !dbg !300
  %add21 = fadd float %5, %mul20, !dbg !298
  store float %add21, float* %sx.addr.1107, align 4, !dbg !301, !tbaa !152
  %inc23 = add nuw nsw i32 %i.1108, 1, !dbg !302
  tail call void @llvm.dbg.value(metadata i32 %inc23, i64 0, metadata !39, metadata !131), !dbg !286
  %add.ptr = getelementptr inbounds float* %sx.addr.1107, i64 %idx.ext, !dbg !297
  tail call void @llvm.dbg.value(metadata float* %add.ptr, i64 0, metadata !35, metadata !131), !dbg !260
  %add.ptr25 = getelementptr inbounds float* %sy.addr.1106, i64 %idx.ext, !dbg !303
  tail call void @llvm.dbg.value(metadata float* %add.ptr25, i64 0, metadata !37, metadata !131), !dbg !262
  %exitcond113 = icmp eq i32 %i.1108, %4, !dbg !296
  br i1 %exitcond113, label %for.end60, label %for.body19, !dbg !296

if.end28:                                         ; preds = %if.end12, %if.end
  %cmp29 = icmp slt i32 %incx, 0, !dbg !304
  br i1 %cmp29, label %if.then31, label %if.end37, !dbg !306

if.then31:                                        ; preds = %if.end28
  %add32 = sub i32 1, %n, !dbg !307
  %mul33 = mul nsw i32 %add32, %incx, !dbg !308
  %add34 = add nsw i32 %mul33, 1, !dbg !308
  %idx.ext35 = sext i32 %add34 to i64, !dbg !309
  %add.ptr36 = getelementptr inbounds float* %sx, i64 %idx.ext35, !dbg !309
  tail call void @llvm.dbg.value(metadata float* %add.ptr36, i64 0, metadata !35, metadata !131), !dbg !260
  br label %if.end37, !dbg !309

if.end37:                                         ; preds = %if.then31, %if.end28
  %sx.addr.2 = phi float* [ %add.ptr36, %if.then31 ], [ %sx, %if.end28 ]
  %cmp38 = icmp slt i32 %incy, 0, !dbg !310
  br i1 %cmp38, label %if.then40, label %for.cond48.preheader, !dbg !312

if.then40:                                        ; preds = %if.end37
  %add42 = sub i32 1, %n, !dbg !313
  %mul43 = mul nsw i32 %add42, %incy, !dbg !314
  %add44 = add nsw i32 %mul43, 1, !dbg !314
  %idx.ext45 = sext i32 %add44 to i64, !dbg !315
  %add.ptr46 = getelementptr inbounds float* %sy, i64 %idx.ext45, !dbg !315
  tail call void @llvm.dbg.value(metadata float* %add.ptr46, i64 0, metadata !37, metadata !131), !dbg !262
  br label %for.cond48.preheader, !dbg !315

for.cond48.preheader:                             ; preds = %if.then40, %if.end37
  %sy.addr.3.ph = phi float* [ %sy, %if.end37 ], [ %add.ptr46, %if.then40 ]
  %cmp49109 = icmp sgt i32 %n, 0, !dbg !316
  br i1 %cmp49109, label %for.body51.lr.ph, label %for.end60, !dbg !319

for.body51.lr.ph:                                 ; preds = %for.cond48.preheader
  %idx.ext56 = sext i32 %incx to i64, !dbg !320
  %idx.ext58 = sext i32 %incy to i64, !dbg !321
  %7 = add i32 %n, -1, !dbg !319
  br label %for.body51, !dbg !319

for.body51:                                       ; preds = %for.body51, %for.body51.lr.ph
  %i.2112 = phi i32 [ 0, %for.body51.lr.ph ], [ %inc55, %for.body51 ]
  %sx.addr.3111 = phi float* [ %sx.addr.2, %for.body51.lr.ph ], [ %add.ptr57, %for.body51 ]
  %sy.addr.3110 = phi float* [ %sy.addr.3.ph, %for.body51.lr.ph ], [ %add.ptr59, %for.body51 ]
  %8 = load float* %sy.addr.3110, align 4, !dbg !322, !tbaa !152
  %9 = load float* %sx.addr.3111, align 4, !dbg !323, !tbaa !152
  %mul52 = fmul float %sa, %9, !dbg !324
  %add53 = fadd float %8, %mul52, !dbg !322
  store float %add53, float* %sx.addr.3111, align 4, !dbg !325, !tbaa !152
  %inc55 = add nuw nsw i32 %i.2112, 1, !dbg !326
  tail call void @llvm.dbg.value(metadata i32 %inc55, i64 0, metadata !39, metadata !131), !dbg !286
  %add.ptr57 = getelementptr inbounds float* %sx.addr.3111, i64 %idx.ext56, !dbg !320
  tail call void @llvm.dbg.value(metadata float* %add.ptr57, i64 0, metadata !35, metadata !131), !dbg !260
  %add.ptr59 = getelementptr inbounds float* %sy.addr.3110, i64 %idx.ext58, !dbg !321
  tail call void @llvm.dbg.value(metadata float* %add.ptr59, i64 0, metadata !37, metadata !131), !dbg !262
  %exitcond114 = icmp eq i32 %i.2112, %7, !dbg !319
  br i1 %exitcond114, label %for.end60, label %for.body51, !dbg !319

for.end60:                                        ; preds = %for.body51, %for.body19, %for.body, %for.cond48.preheader, %for.cond16.preheader, %for.cond.preheader, %entry
  ret void, !dbg !327
}

; Function Attrs: nounwind uwtable
define void @scopy(i32 %n, float* nocapture %sx, i32 %incx, float* nocapture %sy, i32 %incy) #1 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !44, metadata !131), !dbg !328
  tail call void @llvm.dbg.value(metadata float* %sx, i64 0, metadata !45, metadata !131), !dbg !329
  tail call void @llvm.dbg.value(metadata i32 %incx, i64 0, metadata !46, metadata !131), !dbg !330
  tail call void @llvm.dbg.value(metadata float* %sy, i64 0, metadata !47, metadata !131), !dbg !331
  tail call void @llvm.dbg.value(metadata i32 %incy, i64 0, metadata !48, metadata !131), !dbg !332
  %cmp = icmp slt i32 %n, 1, !dbg !333
  br i1 %cmp, label %return, label %if.end, !dbg !335

if.end:                                           ; preds = %entry
  %cmp1 = icmp eq i32 %incx, %incy, !dbg !336
  br i1 %cmp1, label %if.then2, label %if.end19, !dbg !338

if.then2:                                         ; preds = %if.end
  %cmp3 = icmp eq i32 %incx, 1, !dbg !339
  br i1 %cmp3, label %for.body.lr.ph, label %if.end7, !dbg !342

for.body.lr.ph:                                   ; preds = %if.then2
  %0 = add i32 %n, -1, !dbg !343
  br label %for.body, !dbg !343

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %i.080 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %sx.addr.079 = phi float* [ %sx, %for.body.lr.ph ], [ %incdec.ptr, %for.body ]
  %sy.addr.078 = phi float* [ %sy, %for.body.lr.ph ], [ %incdec.ptr6, %for.body ]
  %incdec.ptr = getelementptr inbounds float* %sx.addr.079, i64 1, !dbg !346
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !45, metadata !131), !dbg !329
  %1 = load float* %sx.addr.079, align 4, !dbg !348, !tbaa !152
  %incdec.ptr6 = getelementptr inbounds float* %sy.addr.078, i64 1, !dbg !349
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr6, i64 0, metadata !47, metadata !131), !dbg !331
  store float %1, float* %sy.addr.078, align 4, !dbg !350, !tbaa !152
  %inc = add nuw nsw i32 %i.080, 1, !dbg !351
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !49, metadata !131), !dbg !352
  %exitcond = icmp eq i32 %i.080, %0, !dbg !343
  br i1 %exitcond, label %return, label %for.body, !dbg !343

if.end7:                                          ; preds = %if.then2
  %cmp8 = icmp sgt i32 %incx, 0, !dbg !353
  br i1 %cmp8, label %for.body12.lr.ph, label %if.end19, !dbg !355

for.body12.lr.ph:                                 ; preds = %if.end7
  %idx.ext = sext i32 %incx to i64, !dbg !356
  %2 = add i32 %n, -1, !dbg !360
  br label %for.body12, !dbg !360

for.body12:                                       ; preds = %for.body12, %for.body12.lr.ph
  %i.184 = phi i32 [ 0, %for.body12.lr.ph ], [ %inc14, %for.body12 ]
  %sx.addr.183 = phi float* [ %sx, %for.body12.lr.ph ], [ %add.ptr, %for.body12 ]
  %sy.addr.182 = phi float* [ %sy, %for.body12.lr.ph ], [ %add.ptr16, %for.body12 ]
  %3 = load float* %sx.addr.183, align 4, !dbg !361, !tbaa !152
  store float %3, float* %sy.addr.182, align 4, !dbg !362, !tbaa !152
  %inc14 = add nuw nsw i32 %i.184, 1, !dbg !363
  tail call void @llvm.dbg.value(metadata i32 %inc14, i64 0, metadata !49, metadata !131), !dbg !352
  %add.ptr = getelementptr inbounds float* %sx.addr.183, i64 %idx.ext, !dbg !356
  tail call void @llvm.dbg.value(metadata float* %add.ptr, i64 0, metadata !45, metadata !131), !dbg !329
  %add.ptr16 = getelementptr inbounds float* %sy.addr.182, i64 %idx.ext, !dbg !364
  tail call void @llvm.dbg.value(metadata float* %add.ptr16, i64 0, metadata !47, metadata !131), !dbg !331
  %exitcond90 = icmp eq i32 %i.184, %2, !dbg !360
  br i1 %exitcond90, label %return, label %for.body12, !dbg !360

if.end19:                                         ; preds = %if.end7, %if.end
  %cmp20 = icmp slt i32 %incx, 0, !dbg !365
  br i1 %cmp20, label %if.then21, label %if.end25, !dbg !367

if.then21:                                        ; preds = %if.end19
  %add = sub i32 1, %n, !dbg !368
  %mul = mul nsw i32 %add, %incx, !dbg !369
  %add22 = add nsw i32 %mul, 1, !dbg !369
  %idx.ext23 = sext i32 %add22 to i64, !dbg !370
  %add.ptr24 = getelementptr inbounds float* %sx, i64 %idx.ext23, !dbg !370
  tail call void @llvm.dbg.value(metadata float* %add.ptr24, i64 0, metadata !45, metadata !131), !dbg !329
  br label %if.end25, !dbg !370

if.end25:                                         ; preds = %if.then21, %if.end19
  %sx.addr.2 = phi float* [ %add.ptr24, %if.then21 ], [ %sx, %if.end19 ]
  %cmp26 = icmp slt i32 %incy, 0, !dbg !371
  br i1 %cmp26, label %if.then27, label %for.body37.lr.ph, !dbg !373

if.then27:                                        ; preds = %if.end25
  %add29 = sub i32 1, %n, !dbg !374
  %mul30 = mul nsw i32 %add29, %incy, !dbg !375
  %add31 = add nsw i32 %mul30, 1, !dbg !375
  %idx.ext32 = sext i32 %add31 to i64, !dbg !376
  %add.ptr33 = getelementptr inbounds float* %sy, i64 %idx.ext32, !dbg !376
  tail call void @llvm.dbg.value(metadata float* %add.ptr33, i64 0, metadata !47, metadata !131), !dbg !331
  br label %for.body37.lr.ph, !dbg !376

for.body37.lr.ph:                                 ; preds = %if.end25, %if.then27
  %sy.addr.3.ph = phi float* [ %sy, %if.end25 ], [ %add.ptr33, %if.then27 ]
  %idx.ext40 = sext i32 %incx to i64, !dbg !377
  %idx.ext42 = sext i32 %incy to i64, !dbg !380
  %4 = add i32 %n, -1, !dbg !381
  br label %for.body37, !dbg !381

for.body37:                                       ; preds = %for.body37, %for.body37.lr.ph
  %i.288 = phi i32 [ 0, %for.body37.lr.ph ], [ %inc39, %for.body37 ]
  %sx.addr.387 = phi float* [ %sx.addr.2, %for.body37.lr.ph ], [ %add.ptr41, %for.body37 ]
  %sy.addr.386 = phi float* [ %sy.addr.3.ph, %for.body37.lr.ph ], [ %add.ptr43, %for.body37 ]
  %5 = load float* %sy.addr.386, align 4, !dbg !382, !tbaa !152
  store float %5, float* %sx.addr.387, align 4, !dbg !383, !tbaa !152
  %inc39 = add nuw nsw i32 %i.288, 1, !dbg !384
  tail call void @llvm.dbg.value(metadata i32 %inc39, i64 0, metadata !49, metadata !131), !dbg !352
  %add.ptr41 = getelementptr inbounds float* %sx.addr.387, i64 %idx.ext40, !dbg !377
  tail call void @llvm.dbg.value(metadata float* %add.ptr41, i64 0, metadata !45, metadata !131), !dbg !329
  %add.ptr43 = getelementptr inbounds float* %sy.addr.386, i64 %idx.ext42, !dbg !380
  tail call void @llvm.dbg.value(metadata float* %add.ptr43, i64 0, metadata !47, metadata !131), !dbg !331
  %exitcond91 = icmp eq i32 %i.288, %4, !dbg !381
  br i1 %exitcond91, label %return, label %for.body37, !dbg !381

return:                                           ; preds = %for.body37, %for.body12, %for.body, %entry
  ret void, !dbg !385
}

; Function Attrs: nounwind readonly uwtable
define double @sdot(i32 %n, float* nocapture readonly %sx, i32 %incx, float* nocapture readonly %sy, i32 %incy) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !54, metadata !131), !dbg !386
  tail call void @llvm.dbg.value(metadata float* %sx, i64 0, metadata !55, metadata !131), !dbg !387
  tail call void @llvm.dbg.value(metadata i32 %incx, i64 0, metadata !56, metadata !131), !dbg !388
  tail call void @llvm.dbg.value(metadata float* %sy, i64 0, metadata !57, metadata !131), !dbg !389
  tail call void @llvm.dbg.value(metadata i32 %incy, i64 0, metadata !58, metadata !131), !dbg !390
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !60, metadata !131), !dbg !391
  %cmp = icmp slt i32 %n, 1, !dbg !392
  br i1 %cmp, label %return, label %if.end, !dbg !394

if.end:                                           ; preds = %entry
  %cmp1 = icmp eq i32 %incx, %incy, !dbg !395
  br i1 %cmp1, label %if.then3, label %if.end28, !dbg !397

if.then3:                                         ; preds = %if.end
  %cmp4 = icmp eq i32 %incx, 1, !dbg !398
  br i1 %cmp4, label %for.body.lr.ph, label %if.end11, !dbg !401

for.body.lr.ph:                                   ; preds = %if.then3
  %0 = add i32 %n, -1, !dbg !402
  br label %for.body, !dbg !402

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %stemp.0104 = phi float [ 0.000000e+00, %for.body.lr.ph ], [ %add, %for.body ]
  %i.0103 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %sy.addr.0102 = phi float* [ %sy, %for.body.lr.ph ], [ %incdec.ptr9, %for.body ]
  %sx.addr.0101 = phi float* [ %sx, %for.body.lr.ph ], [ %incdec.ptr, %for.body ]
  %1 = load float* %sx.addr.0101, align 4, !dbg !405, !tbaa !152
  %2 = load float* %sy.addr.0102, align 4, !dbg !407, !tbaa !152
  %mul = fmul float %1, %2, !dbg !408
  %add = fadd float %stemp.0104, %mul, !dbg !409
  tail call void @llvm.dbg.value(metadata float %add, i64 0, metadata !60, metadata !131), !dbg !391
  %inc = add nuw nsw i32 %i.0103, 1, !dbg !410
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !59, metadata !131), !dbg !411
  %incdec.ptr = getelementptr inbounds float* %sx.addr.0101, i64 1, !dbg !412
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !55, metadata !131), !dbg !387
  %incdec.ptr9 = getelementptr inbounds float* %sy.addr.0102, i64 1, !dbg !413
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr9, i64 0, metadata !57, metadata !131), !dbg !389
  %exitcond = icmp eq i32 %i.0103, %0, !dbg !402
  br i1 %exitcond, label %for.end, label %for.body, !dbg !402

for.end:                                          ; preds = %for.body
  %phitmp118 = fpext float %add to double, !dbg !402
  br label %return, !dbg !414

if.end11:                                         ; preds = %if.then3
  %cmp12 = icmp sgt i32 %incx, 0, !dbg !415
  br i1 %cmp12, label %for.body18.lr.ph, label %if.end28, !dbg !417

for.body18.lr.ph:                                 ; preds = %if.end11
  %idx.ext = sext i32 %incx to i64, !dbg !418
  %3 = add i32 %n, -1, !dbg !422
  br label %for.body18, !dbg !422

for.body18:                                       ; preds = %for.body18, %for.body18.lr.ph
  %stemp.1109 = phi float [ 0.000000e+00, %for.body18.lr.ph ], [ %add20, %for.body18 ]
  %i.1108 = phi i32 [ 0, %for.body18.lr.ph ], [ %inc22, %for.body18 ]
  %sy.addr.1107 = phi float* [ %sy, %for.body18.lr.ph ], [ %add.ptr24, %for.body18 ]
  %sx.addr.1106 = phi float* [ %sx, %for.body18.lr.ph ], [ %add.ptr, %for.body18 ]
  %4 = load float* %sx.addr.1106, align 4, !dbg !423, !tbaa !152
  %5 = load float* %sy.addr.1107, align 4, !dbg !424, !tbaa !152
  %mul19 = fmul float %4, %5, !dbg !425
  %add20 = fadd float %stemp.1109, %mul19, !dbg !426
  tail call void @llvm.dbg.value(metadata float %add20, i64 0, metadata !60, metadata !131), !dbg !391
  %inc22 = add nuw nsw i32 %i.1108, 1, !dbg !427
  tail call void @llvm.dbg.value(metadata i32 %inc22, i64 0, metadata !59, metadata !131), !dbg !411
  %add.ptr = getelementptr inbounds float* %sx.addr.1106, i64 %idx.ext, !dbg !418
  tail call void @llvm.dbg.value(metadata float* %add.ptr, i64 0, metadata !55, metadata !131), !dbg !387
  %add.ptr24 = getelementptr inbounds float* %sy.addr.1107, i64 %idx.ext, !dbg !428
  tail call void @llvm.dbg.value(metadata float* %add.ptr24, i64 0, metadata !57, metadata !131), !dbg !389
  %exitcond119 = icmp eq i32 %i.1108, %3, !dbg !422
  br i1 %exitcond119, label %for.end25, label %for.body18, !dbg !422

for.end25:                                        ; preds = %for.body18
  %phitmp117 = fpext float %add20 to double, !dbg !422
  br label %return, !dbg !429

if.end28:                                         ; preds = %if.end11, %if.end
  %cmp29 = icmp slt i32 %incx, 0, !dbg !430
  br i1 %cmp29, label %if.then31, label %if.end37, !dbg !432

if.then31:                                        ; preds = %if.end28
  %add32 = sub i32 1, %n, !dbg !433
  %mul33 = mul nsw i32 %add32, %incx, !dbg !434
  %add34 = add nsw i32 %mul33, 1, !dbg !434
  %idx.ext35 = sext i32 %add34 to i64, !dbg !435
  %add.ptr36 = getelementptr inbounds float* %sx, i64 %idx.ext35, !dbg !435
  tail call void @llvm.dbg.value(metadata float* %add.ptr36, i64 0, metadata !55, metadata !131), !dbg !387
  br label %if.end37, !dbg !435

if.end37:                                         ; preds = %if.then31, %if.end28
  %sx.addr.2 = phi float* [ %add.ptr36, %if.then31 ], [ %sx, %if.end28 ]
  %cmp38 = icmp slt i32 %incy, 0, !dbg !436
  br i1 %cmp38, label %if.then40, label %for.body51.lr.ph, !dbg !438

if.then40:                                        ; preds = %if.end37
  %add42 = sub i32 1, %n, !dbg !439
  %mul43 = mul nsw i32 %add42, %incy, !dbg !440
  %add44 = add nsw i32 %mul43, 1, !dbg !440
  %idx.ext45 = sext i32 %add44 to i64, !dbg !441
  %add.ptr46 = getelementptr inbounds float* %sy, i64 %idx.ext45, !dbg !441
  tail call void @llvm.dbg.value(metadata float* %add.ptr46, i64 0, metadata !57, metadata !131), !dbg !389
  br label %for.body51.lr.ph, !dbg !441

for.body51.lr.ph:                                 ; preds = %if.end37, %if.then40
  %sy.addr.3.ph = phi float* [ %sy, %if.end37 ], [ %add.ptr46, %if.then40 ]
  %idx.ext56 = sext i32 %incx to i64, !dbg !442
  %idx.ext58 = sext i32 %incy to i64, !dbg !445
  %6 = add i32 %n, -1, !dbg !446
  br label %for.body51, !dbg !446

for.body51:                                       ; preds = %for.body51, %for.body51.lr.ph
  %stemp.2115 = phi float [ 0.000000e+00, %for.body51.lr.ph ], [ %add53, %for.body51 ]
  %i.2114 = phi i32 [ 0, %for.body51.lr.ph ], [ %inc55, %for.body51 ]
  %sy.addr.3113 = phi float* [ %sy.addr.3.ph, %for.body51.lr.ph ], [ %add.ptr59, %for.body51 ]
  %sx.addr.3112 = phi float* [ %sx.addr.2, %for.body51.lr.ph ], [ %add.ptr57, %for.body51 ]
  %7 = load float* %sx.addr.3112, align 4, !dbg !447, !tbaa !152
  %8 = load float* %sy.addr.3113, align 4, !dbg !448, !tbaa !152
  %mul52 = fmul float %7, %8, !dbg !449
  %add53 = fadd float %stemp.2115, %mul52, !dbg !450
  tail call void @llvm.dbg.value(metadata float %add53, i64 0, metadata !60, metadata !131), !dbg !391
  %inc55 = add nuw nsw i32 %i.2114, 1, !dbg !451
  tail call void @llvm.dbg.value(metadata i32 %inc55, i64 0, metadata !59, metadata !131), !dbg !411
  %add.ptr57 = getelementptr inbounds float* %sx.addr.3112, i64 %idx.ext56, !dbg !442
  tail call void @llvm.dbg.value(metadata float* %add.ptr57, i64 0, metadata !55, metadata !131), !dbg !387
  %add.ptr59 = getelementptr inbounds float* %sy.addr.3113, i64 %idx.ext58, !dbg !445
  tail call void @llvm.dbg.value(metadata float* %add.ptr59, i64 0, metadata !57, metadata !131), !dbg !389
  %exitcond120 = icmp eq i32 %i.2114, %6, !dbg !446
  br i1 %exitcond120, label %for.end60, label %for.body51, !dbg !446

for.end60:                                        ; preds = %for.body51
  %phitmp = fpext float %add53 to double, !dbg !446
  br label %return, !dbg !452

return:                                           ; preds = %entry, %for.end60, %for.end25, %for.end
  %retval.0 = phi double [ %phitmp118, %for.end ], [ %phitmp117, %for.end25 ], [ %phitmp, %for.end60 ], [ 0.000000e+00, %entry ]
  ret double %retval.0, !dbg !453
}

; Function Attrs: nounwind uwtable
define double @snrm2(i32 %n, float* nocapture readonly %sx, i32 %incx) #1 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !65, metadata !131), !dbg !454
  tail call void @llvm.dbg.value(metadata float* %sx, i64 0, metadata !66, metadata !131), !dbg !455
  tail call void @llvm.dbg.value(metadata i32 %incx, i64 0, metadata !67, metadata !131), !dbg !456
  tail call void @llvm.dbg.value(metadata i32 3, i64 0, metadata !69, metadata !131), !dbg !457
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !70, metadata !131), !dbg !458
  %cmp = icmp slt i32 %n, 1, !dbg !459
  %cmp1 = icmp slt i32 %incx, 1, !dbg !461
  %or.cond = or i1 %cmp, %cmp1, !dbg !463
  br i1 %or.cond, label %return, label %if.end, !dbg !463

if.end:                                           ; preds = %entry
  %call = tail call double @r1mach(), !dbg !464
  %div = fdiv double 1.000000e-45, %call, !dbg !465
  %call2 = tail call double @sqrt(double %div) #5, !dbg !466
  tail call void @llvm.dbg.value(metadata double %call2, i64 0, metadata !71, metadata !131), !dbg !467
  tail call void @llvm.dbg.value(metadata double 1.000000e+19, i64 0, metadata !72, metadata !131), !dbg !468
  %conv = sitofp i32 %n to double, !dbg !469
  %div4 = fdiv double 1.000000e+19, %conv, !dbg !470
  tail call void @llvm.dbg.value(metadata double %div4, i64 0, metadata !73, metadata !131), !dbg !471
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !68, metadata !131), !dbg !472
  %cmp5325 = icmp sgt i32 %n, 0, !dbg !473
  br i1 %cmp5325, label %land.rhs.lr.ph, label %return, !dbg !473

land.rhs.lr.ph:                                   ; preds = %if.end
  %idx.ext = sext i32 %incx to i64, !dbg !474
  br label %land.rhs, !dbg !473

land.rhs:                                         ; preds = %land.rhs.lr.ph, %while.body
  %sx.addr.0327 = phi float* [ %sx, %land.rhs.lr.ph ], [ %add.ptr, %while.body ]
  %i.0326 = phi i32 [ 0, %land.rhs.lr.ph ], [ %inc, %while.body ]
  %0 = load float* %sx.addr.0327, align 4, !dbg !476, !tbaa !152
  %cmp8 = fcmp oeq float %0, 0.000000e+00, !dbg !476
  br i1 %cmp8, label %while.body, label %START.preheader, !dbg !477

START.preheader:                                  ; preds = %land.rhs
  %idx.ext49 = sext i32 %incx to i64, !dbg !479
  br label %START, !dbg !482

while.body:                                       ; preds = %land.rhs
  %inc = add nuw nsw i32 %i.0326, 1, !dbg !483
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !68, metadata !131), !dbg !472
  %add.ptr = getelementptr inbounds float* %sx.addr.0327, i64 %idx.ext, !dbg !474
  tail call void @llvm.dbg.value(metadata float* %add.ptr, i64 0, metadata !66, metadata !131), !dbg !455
  %cmp5 = icmp slt i32 %inc, %n, !dbg !473
  br i1 %cmp5, label %land.rhs, label %return, !dbg !473

START:                                            ; preds = %START.preheader, %if.then68
  %sum.0 = phi double [ %mul72, %if.then68 ], [ 0.000000e+00, %START.preheader ]
  %i.1 = phi i32 [ %i.3309, %if.then68 ], [ %i.0326, %START.preheader ]
  %sx.addr.1 = phi float* [ %sx.addr.3308, %if.then68 ], [ %sx.addr.0327, %START.preheader ]
  %1 = load float* %sx.addr.1, align 4, !dbg !482, !tbaa !152
  %cmp15 = fcmp ogt float %1, 0.000000e+00, !dbg !482
  br i1 %cmp15, label %cond.end, label %cond.false, !dbg !482

cond.false:                                       ; preds = %START
  %sub = fsub float -0.000000e+00, %1, !dbg !484
  br label %cond.end, !dbg !484

cond.end:                                         ; preds = %START, %cond.false
  %cond = phi float [ %sub, %cond.false ], [ %1, %START ], !dbg !482
  %conv17 = fpext float %cond to double, !dbg !486
  %cmp18 = fcmp ogt double %conv17, %call2, !dbg !482
  br i1 %cmp18, label %for.cond.preheader, label %if.else, !dbg !489

for.cond.preheader:                               ; preds = %cond.end
  %cmp21299 = icmp slt i32 %i.1, %n, !dbg !490
  br i1 %cmp21299, label %for.body.lr.ph, label %for.end, !dbg !494

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %idx.ext38 = sext i32 %incx to i64, !dbg !495
  br label %for.body, !dbg !494

for.body:                                         ; preds = %for.body.lr.ph, %if.end35
  %sx.addr.2302 = phi float* [ %sx.addr.1, %for.body.lr.ph ], [ %add.ptr39, %if.end35 ]
  %i.2301 = phi i32 [ %i.1, %for.body.lr.ph ], [ %inc37, %if.end35 ]
  %sum.1300 = phi double [ %sum.0, %for.body.lr.ph ], [ %add, %if.end35 ]
  %2 = load float* %sx.addr.2302, align 4, !dbg !496, !tbaa !152
  %cmp24 = fcmp ogt float %2, 0.000000e+00, !dbg !496
  br i1 %cmp24, label %cond.end29, label %cond.false27, !dbg !496

cond.false27:                                     ; preds = %for.body
  %sub28 = fsub float -0.000000e+00, %2, !dbg !499
  %.pr259 = load float* %sx.addr.2302, align 4, !dbg !501, !tbaa !152
  br label %cond.end29, !dbg !499

cond.end29:                                       ; preds = %for.body, %cond.false27
  %3 = phi float [ %2, %for.body ], [ %.pr259, %cond.false27 ], !dbg !501
  %cond30 = phi float [ %2, %for.body ], [ %sub28, %cond.false27 ], !dbg !496
  %conv31 = fpext float %cond30 to double, !dbg !502
  %cmp32 = fcmp ogt double %conv31, %div4, !dbg !496
  br i1 %cmp32, label %GOT_LARGE, label %if.end35, !dbg !505

if.end35:                                         ; preds = %cond.end29
  %mul = fmul float %3, %3, !dbg !506
  %conv36 = fpext float %mul to double, !dbg !506
  %add = fadd double %sum.1300, %conv36, !dbg !507
  tail call void @llvm.dbg.value(metadata double %add, i64 0, metadata !70, metadata !131), !dbg !458
  %inc37 = add nsw i32 %i.2301, 1, !dbg !508
  tail call void @llvm.dbg.value(metadata i32 %inc37, i64 0, metadata !68, metadata !131), !dbg !472
  %add.ptr39 = getelementptr inbounds float* %sx.addr.2302, i64 %idx.ext38, !dbg !495
  tail call void @llvm.dbg.value(metadata float* %add.ptr39, i64 0, metadata !66, metadata !131), !dbg !455
  %cmp21 = icmp slt i32 %inc37, %n, !dbg !490
  br i1 %cmp21, label %for.body, label %for.end, !dbg !494

for.end:                                          ; preds = %if.end35, %for.cond.preheader
  %sum.1.lcssa = phi double [ %sum.0, %for.cond.preheader ], [ %add, %if.end35 ]
  %call40 = tail call double @sqrt(double %sum.1.lcssa) #5, !dbg !509
  tail call void @llvm.dbg.value(metadata double %call40, i64 0, metadata !70, metadata !131), !dbg !458
  br label %return, !dbg !510

if.else:                                          ; preds = %cond.end
  %4 = load float* %sx.addr.1, align 4, !dbg !511, !tbaa !152
  %cmp42 = fcmp ogt float %4, 0.000000e+00, !dbg !511
  br i1 %cmp42, label %cond.end47, label %cond.false45, !dbg !511

cond.false45:                                     ; preds = %if.else
  %sub46 = fsub float -0.000000e+00, %4, !dbg !512
  br label %cond.end47, !dbg !512

cond.end47:                                       ; preds = %if.else, %cond.false45
  %cond48 = phi float [ %sub46, %cond.false45 ], [ %4, %if.else ], !dbg !511
  tail call void @llvm.dbg.value(metadata float %cond48, i64 0, metadata !74, metadata !131), !dbg !514
  %add52 = fadd double %sum.0, 1.000000e+00, !dbg !515
  tail call void @llvm.dbg.value(metadata double %add52, i64 0, metadata !70, metadata !131), !dbg !458
  %i.3305315 = add nsw i32 %i.1, 1, !dbg !516
  %cmp54306316 = icmp slt i32 %i.3305315, %n, !dbg !517
  br i1 %cmp54306316, label %for.body56.lr.ph, label %for.end110, !dbg !520

for.body56.lr.ph:                                 ; preds = %cond.end47, %for.cond53.outer.backedge
  %i.3305320 = phi i32 [ %i.3305, %for.cond53.outer.backedge ], [ %i.3305315, %cond.end47 ]
  %sx.addr.1.pn = phi float* [ %sx.addr.3308, %for.cond53.outer.backedge ], [ %sx.addr.1, %cond.end47 ]
  %xmax.0.ph318 = phi float [ %xmax.0.ph.be, %for.cond53.outer.backedge ], [ %cond48, %cond.end47 ]
  %sum.2.ph317 = phi double [ %add91, %for.cond53.outer.backedge ], [ %add52, %cond.end47 ]
  br label %for.body56, !dbg !520

for.body56:                                       ; preds = %for.body56.lr.ph, %if.end100
  %i.3309 = phi i32 [ %i.3305320, %for.body56.lr.ph ], [ %i.3, %if.end100 ]
  %sx.addr.1.pn.pn = phi float* [ %sx.addr.1.pn, %for.body56.lr.ph ], [ %sx.addr.3308, %if.end100 ]
  %sum.2307 = phi double [ %sum.2.ph317, %for.body56.lr.ph ], [ %add105, %if.end100 ]
  %sx.addr.3308 = getelementptr inbounds float* %sx.addr.1.pn.pn, i64 %idx.ext49, !dbg !479
  %5 = load float* %sx.addr.3308, align 4, !dbg !521, !tbaa !152
  %cmp58 = fcmp ogt float %5, 0.000000e+00, !dbg !521
  br i1 %cmp58, label %cond.end63, label %cond.false61, !dbg !521

cond.false61:                                     ; preds = %for.body56
  %sub62 = fsub float -0.000000e+00, %5, !dbg !524
  br label %cond.end63, !dbg !524

cond.end63:                                       ; preds = %for.body56, %cond.false61
  %cond64 = phi float [ %sub62, %cond.false61 ], [ %5, %for.body56 ], !dbg !521
  %conv65 = fpext float %cond64 to double, !dbg !526
  %cmp66 = fcmp ogt double %conv65, %call2, !dbg !521
  br i1 %cmp66, label %if.then68, label %if.end73, !dbg !529

if.then68:                                        ; preds = %cond.end63
  %conv69 = fpext float %xmax.0.ph318 to double, !dbg !530
  %mul70 = fmul double %sum.2307, %conv69, !dbg !532
  %mul72 = fmul double %conv69, %mul70, !dbg !533
  tail call void @llvm.dbg.value(metadata double %mul72, i64 0, metadata !70, metadata !131), !dbg !458
  br label %START, !dbg !534

if.end73:                                         ; preds = %cond.end63
  %6 = load float* %sx.addr.3308, align 4, !dbg !535, !tbaa !152
  %cmp75 = fcmp ogt float %6, 0.000000e+00, !dbg !535
  br i1 %cmp75, label %cond.end80, label %cond.false78, !dbg !535

cond.false78:                                     ; preds = %if.end73
  %sub79 = fsub float -0.000000e+00, %6, !dbg !537
  %.pr = load float* %sx.addr.3308, align 4, !dbg !539, !tbaa !152
  br label %cond.end80, !dbg !537

cond.end80:                                       ; preds = %if.end73, %cond.false78
  %7 = phi float [ %6, %if.end73 ], [ %.pr, %cond.false78 ], !dbg !539
  %cond81 = phi float [ %6, %if.end73 ], [ %sub79, %cond.false78 ], !dbg !535
  %cmp82 = fcmp ogt float %cond81, %xmax.0.ph318, !dbg !535
  br i1 %cmp82, label %if.then84, label %if.end100, !dbg !541

if.then84:                                        ; preds = %cond.end80
  %div85 = fdiv float %xmax.0.ph318, %7, !dbg !542
  %conv86 = fpext float %div85 to double, !dbg !543
  %mul87 = fmul double %sum.2307, %conv86, !dbg !544
  %mul90 = fmul double %conv86, %mul87, !dbg !544
  %add91 = fadd double %mul90, 1.000000e+00, !dbg !545
  tail call void @llvm.dbg.value(metadata double %add91, i64 0, metadata !70, metadata !131), !dbg !458
  %cmp93 = fcmp ogt float %7, 0.000000e+00, !dbg !546
  br i1 %cmp93, label %for.cond53.outer.backedge, label %cond.false96, !dbg !546

for.cond53.outer.backedge:                        ; preds = %if.then84, %cond.false96
  %xmax.0.ph.be = phi float [ %sub97, %cond.false96 ], [ %7, %if.then84 ]
  %i.3305 = add nsw i32 %i.3309, 1, !dbg !516
  %cmp54306 = icmp slt i32 %i.3305, %n, !dbg !517
  br i1 %cmp54306, label %for.body56.lr.ph, label %for.end110, !dbg !520

cond.false96:                                     ; preds = %if.then84
  %sub97 = fsub float -0.000000e+00, %7, !dbg !547
  br label %for.cond53.outer.backedge, !dbg !547

if.end100:                                        ; preds = %cond.end80
  %div101 = fdiv float %7, %xmax.0.ph318, !dbg !549
  %mul103 = fmul float %div101, %div101, !dbg !550
  %conv104 = fpext float %mul103 to double, !dbg !550
  %add105 = fadd double %sum.2307, %conv104, !dbg !551
  tail call void @llvm.dbg.value(metadata double %add105, i64 0, metadata !70, metadata !131), !dbg !458
  %i.3 = add nsw i32 %i.3309, 1, !dbg !516
  %cmp54 = icmp slt i32 %i.3, %n, !dbg !517
  br i1 %cmp54, label %for.body56, label %for.end110, !dbg !520

for.end110:                                       ; preds = %cond.end47, %for.cond53.outer.backedge, %if.end100
  %xmax.0.ph.lcssa275 = phi float [ %xmax.0.ph318, %if.end100 ], [ %xmax.0.ph.be, %for.cond53.outer.backedge ], [ %cond48, %cond.end47 ]
  %sum.2.lcssa = phi double [ %add105, %if.end100 ], [ %add91, %for.cond53.outer.backedge ], [ %add52, %cond.end47 ]
  %conv111 = fpext float %xmax.0.ph.lcssa275 to double, !dbg !552
  %call112 = tail call double @sqrt(double %sum.2.lcssa) #5, !dbg !553
  %mul113 = fmul double %conv111, %call112, !dbg !552
  br label %return, !dbg !554

GOT_LARGE:                                        ; preds = %cond.end29
  %conv114 = fpext float %3 to double, !dbg !555
  %div115 = fdiv double %sum.1300, %conv114, !dbg !556
  %div117 = fdiv double %div115, %conv114, !dbg !557
  %add118 = fadd double %div117, 1.000000e+00, !dbg !558
  tail call void @llvm.dbg.value(metadata double %add118, i64 0, metadata !70, metadata !131), !dbg !458
  %cmp120 = fcmp ogt float %3, 0.000000e+00, !dbg !559
  br i1 %cmp120, label %cond.end125, label %cond.false123, !dbg !559

cond.false123:                                    ; preds = %GOT_LARGE
  %sub124 = fsub float -0.000000e+00, %3, !dbg !560
  br label %cond.end125, !dbg !560

cond.end125:                                      ; preds = %GOT_LARGE, %cond.false123
  %cond126 = phi float [ %sub124, %cond.false123 ], [ %3, %GOT_LARGE ], !dbg !559
  tail call void @llvm.dbg.value(metadata float %cond126, i64 0, metadata !74, metadata !131), !dbg !514
  %idx.ext127 = sext i32 %incx to i64, !dbg !562
  %i.4282291 = add nsw i32 %i.2301, 1, !dbg !563
  %cmp131283292 = icmp slt i32 %i.4282291, %n, !dbg !564
  br i1 %cmp131283292, label %for.body133.lr.ph, label %for.end170, !dbg !567

for.body133.lr.ph:                                ; preds = %cond.end125, %for.cond130.outer.backedge
  %i.4282296 = phi i32 [ %i.4282, %for.cond130.outer.backedge ], [ %i.4282291, %cond.end125 ]
  %sx.addr.2302.pn = phi float* [ %sx.addr.4285, %for.cond130.outer.backedge ], [ %sx.addr.2302, %cond.end125 ]
  %xmax.2.ph294 = phi float [ %xmax.2.ph.be, %for.cond130.outer.backedge ], [ %cond126, %cond.end125 ]
  %sum.4.ph293 = phi double [ %add151, %for.cond130.outer.backedge ], [ %add118, %cond.end125 ]
  br label %for.body133, !dbg !567

for.body133:                                      ; preds = %for.body133.lr.ph, %if.end160
  %i.4286 = phi i32 [ %i.4282296, %for.body133.lr.ph ], [ %i.4, %if.end160 ]
  %sx.addr.2302.pn.pn = phi float* [ %sx.addr.2302.pn, %for.body133.lr.ph ], [ %sx.addr.4285, %if.end160 ]
  %sum.4284 = phi double [ %sum.4.ph293, %for.body133.lr.ph ], [ %add165, %if.end160 ]
  %sx.addr.4285 = getelementptr inbounds float* %sx.addr.2302.pn.pn, i64 %idx.ext127, !dbg !562
  %8 = load float* %sx.addr.4285, align 4, !dbg !568, !tbaa !152
  %cmp135 = fcmp ogt float %8, 0.000000e+00, !dbg !568
  br i1 %cmp135, label %cond.end140, label %cond.false138, !dbg !568

cond.false138:                                    ; preds = %for.body133
  %sub139 = fsub float -0.000000e+00, %8, !dbg !571
  %.pr260 = load float* %sx.addr.4285, align 4, !dbg !573, !tbaa !152
  br label %cond.end140, !dbg !571

cond.end140:                                      ; preds = %for.body133, %cond.false138
  %9 = phi float [ %8, %for.body133 ], [ %.pr260, %cond.false138 ], !dbg !573
  %cond141 = phi float [ %8, %for.body133 ], [ %sub139, %cond.false138 ], !dbg !568
  %cmp142 = fcmp ogt float %cond141, %xmax.2.ph294, !dbg !568
  br i1 %cmp142, label %if.then144, label %if.end160, !dbg !575

if.then144:                                       ; preds = %cond.end140
  %div145 = fdiv float %xmax.2.ph294, %9, !dbg !576
  %conv146 = fpext float %div145 to double, !dbg !577
  %mul147 = fmul double %sum.4284, %conv146, !dbg !578
  %mul150 = fmul double %conv146, %mul147, !dbg !578
  %add151 = fadd double %mul150, 1.000000e+00, !dbg !579
  tail call void @llvm.dbg.value(metadata double %add151, i64 0, metadata !70, metadata !131), !dbg !458
  %cmp153 = fcmp ogt float %9, 0.000000e+00, !dbg !580
  br i1 %cmp153, label %for.cond130.outer.backedge, label %cond.false156, !dbg !580

for.cond130.outer.backedge:                       ; preds = %if.then144, %cond.false156
  %xmax.2.ph.be = phi float [ %sub157, %cond.false156 ], [ %9, %if.then144 ]
  %i.4282 = add nsw i32 %i.4286, 1, !dbg !563
  %cmp131283 = icmp slt i32 %i.4282, %n, !dbg !564
  br i1 %cmp131283, label %for.body133.lr.ph, label %for.end170, !dbg !567

cond.false156:                                    ; preds = %if.then144
  %sub157 = fsub float -0.000000e+00, %9, !dbg !581
  br label %for.cond130.outer.backedge, !dbg !581

if.end160:                                        ; preds = %cond.end140
  %div161 = fdiv float %9, %xmax.2.ph294, !dbg !583
  %mul163 = fmul float %div161, %div161, !dbg !584
  %conv164 = fpext float %mul163 to double, !dbg !584
  %add165 = fadd double %sum.4284, %conv164, !dbg !585
  tail call void @llvm.dbg.value(metadata double %add165, i64 0, metadata !70, metadata !131), !dbg !458
  %i.4 = add nsw i32 %i.4286, 1, !dbg !563
  %cmp131 = icmp slt i32 %i.4, %n, !dbg !564
  br i1 %cmp131, label %for.body133, label %for.end170, !dbg !567

for.end170:                                       ; preds = %for.cond130.outer.backedge, %if.end160, %cond.end125
  %xmax.2.ph.lcssa = phi float [ %cond126, %cond.end125 ], [ %xmax.2.ph294, %if.end160 ], [ %xmax.2.ph.be, %for.cond130.outer.backedge ]
  %sum.4.lcssa = phi double [ %add118, %cond.end125 ], [ %add165, %if.end160 ], [ %add151, %for.cond130.outer.backedge ]
  %conv171 = fpext float %xmax.2.ph.lcssa to double, !dbg !586
  %call172 = tail call double @sqrt(double %sum.4.lcssa) #5, !dbg !587
  %mul173 = fmul double %conv171, %call172, !dbg !586
  br label %return, !dbg !588

return:                                           ; preds = %while.body, %if.end, %entry, %for.end170, %for.end110, %for.end
  %retval.0 = phi double [ %mul173, %for.end170 ], [ %call40, %for.end ], [ %mul113, %for.end110 ], [ 0.000000e+00, %entry ], [ 0.000000e+00, %if.end ], [ 0.000000e+00, %while.body ]
  ret double %retval.0, !dbg !589
}

; Function Attrs: nounwind
declare double @sqrt(double) #2

; Function Attrs: nounwind readnone uwtable
define double @r1mach() #3 {
entry:
  tail call void @llvm.dbg.value(metadata float 1.000000e+00, i64 0, metadata !78, metadata !131), !dbg !590
  br label %do.body, !dbg !591

do.body:                                          ; preds = %do.body, %entry
  %u.0 = phi float [ 1.000000e+00, %entry ], [ %conv1, %do.body ]
  %conv1 = fmul float %u.0, 5.000000e-01, !dbg !592
  tail call void @llvm.dbg.value(metadata float %conv1, i64 0, metadata !78, metadata !131), !dbg !590
  %conv3 = fadd float %conv1, 1.000000e+00, !dbg !594
  tail call void @llvm.dbg.value(metadata float %conv3, i64 0, metadata !79, metadata !131), !dbg !595
  %cmp = fcmp une float %conv3, 1.000000e+00, !dbg !596
  br i1 %cmp, label %do.body, label %do.end, !dbg !597

do.end:                                           ; preds = %do.body
  %conv2 = fpext float %conv1 to double, !dbg !598
  %mul7 = fmul double %conv2, 2.000000e+00, !dbg !599
  ret double %mul7, !dbg !600
}

; Function Attrs: nounwind readnone uwtable
define i32 @min0(i32 %n, i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i32 %g, i32 %h, i32 %i, i32 %j, i32 %k, i32 %l, i32 %m, i32 %o, i32 %p) #3 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !84, metadata !131), !dbg !601
  tail call void @llvm.dbg.value(metadata i32 %a, i64 0, metadata !85, metadata !131), !dbg !602
  tail call void @llvm.dbg.value(metadata i32 %b, i64 0, metadata !86, metadata !131), !dbg !603
  tail call void @llvm.dbg.value(metadata i32 %c, i64 0, metadata !87, metadata !131), !dbg !604
  tail call void @llvm.dbg.value(metadata i32 %d, i64 0, metadata !88, metadata !131), !dbg !605
  tail call void @llvm.dbg.value(metadata i32 %e, i64 0, metadata !89, metadata !131), !dbg !606
  tail call void @llvm.dbg.value(metadata i32 %f, i64 0, metadata !90, metadata !131), !dbg !607
  tail call void @llvm.dbg.value(metadata i32 %g, i64 0, metadata !91, metadata !131), !dbg !608
  tail call void @llvm.dbg.value(metadata i32 %h, i64 0, metadata !92, metadata !131), !dbg !609
  tail call void @llvm.dbg.value(metadata i32 %i, i64 0, metadata !93, metadata !131), !dbg !610
  tail call void @llvm.dbg.value(metadata i32 %j, i64 0, metadata !94, metadata !131), !dbg !611
  tail call void @llvm.dbg.value(metadata i32 %k, i64 0, metadata !95, metadata !131), !dbg !612
  tail call void @llvm.dbg.value(metadata i32 %l, i64 0, metadata !96, metadata !131), !dbg !613
  tail call void @llvm.dbg.value(metadata i32 %m, i64 0, metadata !97, metadata !131), !dbg !614
  tail call void @llvm.dbg.value(metadata i32 %o, i64 0, metadata !98, metadata !131), !dbg !615
  tail call void @llvm.dbg.value(metadata i32 %p, i64 0, metadata !99, metadata !131), !dbg !616
  %n.off = add i32 %n, -1, !dbg !617
  %0 = icmp ugt i32 %n.off, 14, !dbg !617
  br i1 %0, label %return, label %if.end, !dbg !617

if.end:                                           ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 %a, i64 0, metadata !100, metadata !131), !dbg !618
  %cmp2 = icmp eq i32 %n, 1, !dbg !619
  br i1 %cmp2, label %return, label %if.end4, !dbg !621

if.end4:                                          ; preds = %if.end
  %cmp5 = icmp sgt i32 %a, %b, !dbg !622
  tail call void @llvm.dbg.value(metadata i32 %b, i64 0, metadata !100, metadata !131), !dbg !618
  %b.a = select i1 %cmp5, i32 %b, i32 %a, !dbg !624
  %cmp8 = icmp eq i32 %n, 2, !dbg !625
  br i1 %cmp8, label %return, label %if.end10, !dbg !627

if.end10:                                         ; preds = %if.end4
  %cmp11 = icmp sgt i32 %b.a, %c, !dbg !628
  tail call void @llvm.dbg.value(metadata i32 %c, i64 0, metadata !100, metadata !131), !dbg !618
  %c.b.a = select i1 %cmp11, i32 %c, i32 %b.a, !dbg !630
  %cmp14 = icmp eq i32 %n, 3, !dbg !631
  br i1 %cmp14, label %return, label %if.end16, !dbg !633

if.end16:                                         ; preds = %if.end10
  %cmp17 = icmp sgt i32 %c.b.a, %d, !dbg !634
  tail call void @llvm.dbg.value(metadata i32 %d, i64 0, metadata !100, metadata !131), !dbg !618
  %d.c.b.a = select i1 %cmp17, i32 %d, i32 %c.b.a, !dbg !636
  %cmp20 = icmp eq i32 %n, 4, !dbg !637
  br i1 %cmp20, label %return, label %if.end22, !dbg !639

if.end22:                                         ; preds = %if.end16
  %cmp23 = icmp sgt i32 %d.c.b.a, %e, !dbg !640
  tail call void @llvm.dbg.value(metadata i32 %e, i64 0, metadata !100, metadata !131), !dbg !618
  %e.d.c.b.a = select i1 %cmp23, i32 %e, i32 %d.c.b.a, !dbg !642
  %cmp26 = icmp eq i32 %n, 5, !dbg !643
  br i1 %cmp26, label %return, label %if.end28, !dbg !645

if.end28:                                         ; preds = %if.end22
  %cmp29 = icmp sgt i32 %e.d.c.b.a, %f, !dbg !646
  tail call void @llvm.dbg.value(metadata i32 %f, i64 0, metadata !100, metadata !131), !dbg !618
  %f.e.d.c.b.a = select i1 %cmp29, i32 %f, i32 %e.d.c.b.a, !dbg !648
  %cmp32 = icmp eq i32 %n, 6, !dbg !649
  br i1 %cmp32, label %return, label %if.end34, !dbg !651

if.end34:                                         ; preds = %if.end28
  %cmp35 = icmp sgt i32 %f.e.d.c.b.a, %g, !dbg !652
  tail call void @llvm.dbg.value(metadata i32 %g, i64 0, metadata !100, metadata !131), !dbg !618
  %g.f.e.d.c.b.a = select i1 %cmp35, i32 %g, i32 %f.e.d.c.b.a, !dbg !654
  %cmp38 = icmp eq i32 %n, 7, !dbg !655
  br i1 %cmp38, label %return, label %if.end40, !dbg !657

if.end40:                                         ; preds = %if.end34
  %cmp41 = icmp sgt i32 %g.f.e.d.c.b.a, %h, !dbg !658
  tail call void @llvm.dbg.value(metadata i32 %h, i64 0, metadata !100, metadata !131), !dbg !618
  %h.g.f.e.d.c.b.a = select i1 %cmp41, i32 %h, i32 %g.f.e.d.c.b.a, !dbg !660
  %cmp44 = icmp eq i32 %n, 8, !dbg !661
  br i1 %cmp44, label %return, label %if.end46, !dbg !663

if.end46:                                         ; preds = %if.end40
  %cmp47 = icmp sgt i32 %h.g.f.e.d.c.b.a, %i, !dbg !664
  tail call void @llvm.dbg.value(metadata i32 %i, i64 0, metadata !100, metadata !131), !dbg !618
  %i.h.g.f.e.d.c.b.a = select i1 %cmp47, i32 %i, i32 %h.g.f.e.d.c.b.a, !dbg !666
  %cmp50 = icmp eq i32 %n, 9, !dbg !667
  br i1 %cmp50, label %return, label %if.end52, !dbg !669

if.end52:                                         ; preds = %if.end46
  %cmp53 = icmp sgt i32 %i.h.g.f.e.d.c.b.a, %j, !dbg !670
  tail call void @llvm.dbg.value(metadata i32 %j, i64 0, metadata !100, metadata !131), !dbg !618
  %j.i.h.g.f.e.d.c.b.a = select i1 %cmp53, i32 %j, i32 %i.h.g.f.e.d.c.b.a, !dbg !672
  %cmp56 = icmp eq i32 %n, 10, !dbg !673
  br i1 %cmp56, label %return, label %if.end58, !dbg !675

if.end58:                                         ; preds = %if.end52
  %cmp59 = icmp sgt i32 %j.i.h.g.f.e.d.c.b.a, %k, !dbg !676
  tail call void @llvm.dbg.value(metadata i32 %k, i64 0, metadata !100, metadata !131), !dbg !618
  %k.j.i.h.g.f.e.d.c.b.a = select i1 %cmp59, i32 %k, i32 %j.i.h.g.f.e.d.c.b.a, !dbg !678
  %cmp62 = icmp eq i32 %n, 11, !dbg !679
  br i1 %cmp62, label %return, label %if.end64, !dbg !681

if.end64:                                         ; preds = %if.end58
  %cmp65 = icmp sgt i32 %k.j.i.h.g.f.e.d.c.b.a, %l, !dbg !682
  tail call void @llvm.dbg.value(metadata i32 %l, i64 0, metadata !100, metadata !131), !dbg !618
  %l.k.j.i.h.g.f.e.d.c.b.a = select i1 %cmp65, i32 %l, i32 %k.j.i.h.g.f.e.d.c.b.a, !dbg !684
  %cmp68 = icmp eq i32 %n, 12, !dbg !685
  br i1 %cmp68, label %return, label %if.end70, !dbg !687

if.end70:                                         ; preds = %if.end64
  %cmp71 = icmp sgt i32 %l.k.j.i.h.g.f.e.d.c.b.a, %m, !dbg !688
  tail call void @llvm.dbg.value(metadata i32 %m, i64 0, metadata !100, metadata !131), !dbg !618
  %m.l.k.j.i.h.g.f.e.d.c.b.a = select i1 %cmp71, i32 %m, i32 %l.k.j.i.h.g.f.e.d.c.b.a, !dbg !690
  %cmp74 = icmp eq i32 %n, 13, !dbg !691
  br i1 %cmp74, label %return, label %if.end76, !dbg !693

if.end76:                                         ; preds = %if.end70
  %cmp77 = icmp sgt i32 %m.l.k.j.i.h.g.f.e.d.c.b.a, %o, !dbg !694
  tail call void @llvm.dbg.value(metadata i32 %o, i64 0, metadata !100, metadata !131), !dbg !618
  %o.m.l.k.j.i.h.g.f.e.d.c.b.a = select i1 %cmp77, i32 %o, i32 %m.l.k.j.i.h.g.f.e.d.c.b.a, !dbg !696
  %cmp80 = icmp eq i32 %n, 14, !dbg !697
  br i1 %cmp80, label %return, label %if.end82, !dbg !699

if.end82:                                         ; preds = %if.end76
  %cmp83 = icmp sgt i32 %o.m.l.k.j.i.h.g.f.e.d.c.b.a, %p, !dbg !700
  tail call void @llvm.dbg.value(metadata i32 %p, i64 0, metadata !100, metadata !131), !dbg !618
  %p.o.m.l.k.j.i.h.g.f.e.d.c.b.a = select i1 %cmp83, i32 %p, i32 %o.m.l.k.j.i.h.g.f.e.d.c.b.a, !dbg !702
  br label %return, !dbg !703

return:                                           ; preds = %if.end76, %if.end70, %if.end64, %if.end58, %if.end52, %if.end46, %if.end40, %if.end34, %if.end28, %if.end22, %if.end16, %if.end10, %if.end4, %if.end, %entry, %if.end82
  %retval.0 = phi i32 [ %p.o.m.l.k.j.i.h.g.f.e.d.c.b.a, %if.end82 ], [ -1, %entry ], [ %a, %if.end ], [ %b.a, %if.end4 ], [ %c.b.a, %if.end10 ], [ %d.c.b.a, %if.end16 ], [ %e.d.c.b.a, %if.end22 ], [ %f.e.d.c.b.a, %if.end28 ], [ %g.f.e.d.c.b.a, %if.end34 ], [ %h.g.f.e.d.c.b.a, %if.end40 ], [ %i.h.g.f.e.d.c.b.a, %if.end46 ], [ %j.i.h.g.f.e.d.c.b.a, %if.end52 ], [ %k.j.i.h.g.f.e.d.c.b.a, %if.end58 ], [ %l.k.j.i.h.g.f.e.d.c.b.a, %if.end64 ], [ %m.l.k.j.i.h.g.f.e.d.c.b.a, %if.end70 ], [ %o.m.l.k.j.i.h.g.f.e.d.c.b.a, %if.end76 ]
  ret i32 %retval.0, !dbg !704
}

; Function Attrs: nounwind uwtable
define i32 @sscal(i32 %n, double, float* nocapture %sx, i32 %incx) #1 {
entry:
  %sa = fptrunc double %0 to float
  tail call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !105, metadata !131), !dbg !705
  tail call void @llvm.dbg.value(metadata float %sa, i64 0, metadata !106, metadata !131), !dbg !706
  tail call void @llvm.dbg.value(metadata float* %sx, i64 0, metadata !107, metadata !131), !dbg !707
  tail call void @llvm.dbg.value(metadata i32 %incx, i64 0, metadata !108, metadata !131), !dbg !708
  %cmp = icmp slt i32 %n, 1, !dbg !709
  br i1 %cmp, label %return, label %if.end, !dbg !711

if.end:                                           ; preds = %entry
  %cmp1 = icmp eq i32 %incx, 1, !dbg !712
  br i1 %cmp1, label %for.body13.lr.ph, label %if.then2, !dbg !714

for.body13.lr.ph:                                 ; preds = %if.end
  %1 = add i32 %n, -1, !dbg !715
  br label %for.body13, !dbg !715

if.then2:                                         ; preds = %if.end
  %cmp3 = icmp slt i32 %incx, 0, !dbg !717
  br i1 %cmp3, label %if.then4, label %for.body.lr.ph, !dbg !720

if.then4:                                         ; preds = %if.then2
  %add = sub i32 1, %n, !dbg !721
  %mul = mul nsw i32 %add, %incx, !dbg !722
  %idx.ext = sext i32 %mul to i64, !dbg !723
  %add.ptr = getelementptr inbounds float* %sx, i64 %idx.ext, !dbg !723
  tail call void @llvm.dbg.value(metadata float* %add.ptr, i64 0, metadata !107, metadata !131), !dbg !707
  br label %for.body.lr.ph, !dbg !723

for.body.lr.ph:                                   ; preds = %if.then2, %if.then4
  %sx.addr.1.ph = phi float* [ %sx, %if.then2 ], [ %add.ptr, %if.then4 ]
  %idx.ext8 = sext i32 %incx to i64, !dbg !724
  %2 = add i32 %n, -1, !dbg !727
  br label %for.body, !dbg !727

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %i.038 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %sx.addr.137 = phi float* [ %sx.addr.1.ph, %for.body.lr.ph ], [ %add.ptr9, %for.body ]
  %3 = load float* %sx.addr.137, align 4, !dbg !728, !tbaa !152
  %mul7 = fmul float %sa, %3, !dbg !728
  store float %mul7, float* %sx.addr.137, align 4, !dbg !728, !tbaa !152
  %inc = add nuw nsw i32 %i.038, 1, !dbg !729
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !109, metadata !131), !dbg !730
  %add.ptr9 = getelementptr inbounds float* %sx.addr.137, i64 %idx.ext8, !dbg !724
  tail call void @llvm.dbg.value(metadata float* %add.ptr9, i64 0, metadata !107, metadata !131), !dbg !707
  %exitcond39 = icmp eq i32 %i.038, %2, !dbg !727
  br i1 %exitcond39, label %return, label %for.body, !dbg !727

for.body13:                                       ; preds = %for.body13, %for.body13.lr.ph
  %i.135 = phi i32 [ 0, %for.body13.lr.ph ], [ %inc16, %for.body13 ]
  %sx.addr.234 = phi float* [ %sx, %for.body13.lr.ph ], [ %incdec.ptr, %for.body13 ]
  %4 = load float* %sx.addr.234, align 4, !dbg !731, !tbaa !152
  %mul14 = fmul float %sa, %4, !dbg !731
  store float %mul14, float* %sx.addr.234, align 4, !dbg !731, !tbaa !152
  %inc16 = add nuw nsw i32 %i.135, 1, !dbg !733
  tail call void @llvm.dbg.value(metadata i32 %inc16, i64 0, metadata !109, metadata !131), !dbg !730
  %incdec.ptr = getelementptr inbounds float* %sx.addr.234, i64 1, !dbg !734
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !107, metadata !131), !dbg !707
  %exitcond = icmp eq i32 %i.135, %1, !dbg !715
  br i1 %exitcond, label %return, label %for.body13, !dbg !715

return:                                           ; preds = %for.body, %for.body13, %entry
  %retval.0 = phi i32 [ 1, %entry ], [ 0, %for.body13 ], [ 0, %for.body ]
  ret i32 %retval.0, !dbg !735
}

; Function Attrs: nounwind uwtable
define void @vexopy(i32 %n, float* nocapture %v, float* nocapture readonly %x, float* nocapture readonly %y, i32 %itype) #1 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !114, metadata !131), !dbg !736
  tail call void @llvm.dbg.value(metadata float* %v, i64 0, metadata !115, metadata !131), !dbg !737
  tail call void @llvm.dbg.value(metadata float* %x, i64 0, metadata !116, metadata !131), !dbg !738
  tail call void @llvm.dbg.value(metadata float* %y, i64 0, metadata !117, metadata !131), !dbg !739
  tail call void @llvm.dbg.value(metadata i32 %itype, i64 0, metadata !118, metadata !131), !dbg !740
  %cmp = icmp slt i32 %n, 1, !dbg !741
  br i1 %cmp, label %if.end15, label %if.end, !dbg !743

if.end:                                           ; preds = %entry
  %cmp1 = icmp eq i32 %itype, 1, !dbg !744
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !119, metadata !131), !dbg !746
  %0 = add i32 %n, -1, !dbg !747
  br i1 %cmp1, label %for.body, label %for.body8, !dbg !749

for.body:                                         ; preds = %if.end, %for.body
  %i.035 = phi i32 [ %inc, %for.body ], [ 0, %if.end ]
  %v.addr.034 = phi float* [ %incdec.ptr5, %for.body ], [ %v, %if.end ]
  %y.addr.033 = phi float* [ %incdec.ptr4, %for.body ], [ %y, %if.end ]
  %x.addr.032 = phi float* [ %incdec.ptr, %for.body ], [ %x, %if.end ]
  %1 = load float* %x.addr.032, align 4, !dbg !750, !tbaa !152
  %2 = load float* %y.addr.033, align 4, !dbg !752, !tbaa !152
  %add = fadd float %1, %2, !dbg !750
  store float %add, float* %v.addr.034, align 4, !dbg !753, !tbaa !152
  %inc = add nuw nsw i32 %i.035, 1, !dbg !754
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !119, metadata !131), !dbg !746
  %incdec.ptr = getelementptr inbounds float* %x.addr.032, i64 1, !dbg !755
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !116, metadata !131), !dbg !738
  %incdec.ptr4 = getelementptr inbounds float* %y.addr.033, i64 1, !dbg !756
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr4, i64 0, metadata !117, metadata !131), !dbg !739
  %incdec.ptr5 = getelementptr inbounds float* %v.addr.034, i64 1, !dbg !757
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr5, i64 0, metadata !115, metadata !131), !dbg !737
  %exitcond = icmp eq i32 %i.035, %0, !dbg !747
  br i1 %exitcond, label %if.end15, label %for.body, !dbg !747

for.body8:                                        ; preds = %if.end, %for.body8
  %i.140 = phi i32 [ %inc10, %for.body8 ], [ 0, %if.end ]
  %v.addr.139 = phi float* [ %incdec.ptr13, %for.body8 ], [ %v, %if.end ]
  %y.addr.138 = phi float* [ %incdec.ptr12, %for.body8 ], [ %y, %if.end ]
  %x.addr.137 = phi float* [ %incdec.ptr11, %for.body8 ], [ %x, %if.end ]
  %3 = load float* %x.addr.137, align 4, !dbg !758, !tbaa !152
  %4 = load float* %y.addr.138, align 4, !dbg !761, !tbaa !152
  %sub = fsub float %3, %4, !dbg !758
  store float %sub, float* %v.addr.139, align 4, !dbg !762, !tbaa !152
  %inc10 = add nuw nsw i32 %i.140, 1, !dbg !763
  tail call void @llvm.dbg.value(metadata i32 %inc10, i64 0, metadata !119, metadata !131), !dbg !746
  %incdec.ptr11 = getelementptr inbounds float* %x.addr.137, i64 1, !dbg !764
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr11, i64 0, metadata !116, metadata !131), !dbg !738
  %incdec.ptr12 = getelementptr inbounds float* %y.addr.138, i64 1, !dbg !765
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr12, i64 0, metadata !117, metadata !131), !dbg !739
  %incdec.ptr13 = getelementptr inbounds float* %v.addr.139, i64 1, !dbg !766
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr13, i64 0, metadata !115, metadata !131), !dbg !737
  %exitcond41 = icmp eq i32 %i.140, %0, !dbg !767
  br i1 %exitcond41, label %if.end15, label %for.body8, !dbg !767

if.end15:                                         ; preds = %for.body8, %for.body, %entry
  ret void, !dbg !768
}

; Function Attrs: nounwind uwtable
define void @vfill(i32 %n, float* nocapture %v, double) #1 {
entry:
  %val = fptrunc double %0 to float
  tail call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !124, metadata !131), !dbg !769
  tail call void @llvm.dbg.value(metadata float* %v, i64 0, metadata !125, metadata !131), !dbg !770
  tail call void @llvm.dbg.value(metadata float %val, i64 0, metadata !126, metadata !131), !dbg !771
  %cmp = icmp slt i32 %n, 1, !dbg !772
  br i1 %cmp, label %for.end, label %for.body.lr.ph, !dbg !774

for.body.lr.ph:                                   ; preds = %entry
  %1 = add i32 %n, -1, !dbg !775
  br label %for.body, !dbg !775

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %i.07 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %v.addr.06 = phi float* [ %v, %for.body.lr.ph ], [ %incdec.ptr, %for.body ]
  store float %val, float* %v.addr.06, align 4, !dbg !777, !tbaa !152
  %inc = add nuw nsw i32 %i.07, 1, !dbg !779
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !127, metadata !131), !dbg !780
  %incdec.ptr = getelementptr inbounds float* %v.addr.06, i64 1, !dbg !781
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !125, metadata !131), !dbg !770
  %exitcond = icmp eq i32 %i.07, %1, !dbg !775
  br i1 %exitcond, label %for.end, label %for.body, !dbg !775

for.end:                                          ; preds = %for.body, %entry
  ret void, !dbg !782
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #4

attributes #0 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!128, !129}
!llvm.ident = !{!130}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !5, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c] [DW_LANG_C99]
!1 = !{!"blas.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!5 = !{!6, !20, !31, !40, !50, !61, !75, !80, !101, !110, !120}
!6 = !{!"0x2e\00isamax\00isamax\00\0023\000\001\000\000\000\001\0036", !1, !7, !8, null, i32 (i32, float*, i32)* @isamax, null, null, !13} ; [ DW_TAG_subprogram ] [line 23] [def] [scope 36] [isamax]
!7 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!8 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !9, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = !{!10, !10, !11, !10}
!10 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!11 = !{!"0xf\00\000\0064\0064\000\000", null, null, !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!12 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!13 = !{!14, !15, !16, !17, !18, !19}
!14 = !{!"0x101\00n\0016777241\000", !6, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 25]
!15 = !{!"0x101\00sx\0033554456\000", !6, !7, !11} ; [ DW_TAG_arg_variable ] [sx] [line 24]
!16 = !{!"0x101\00incx\0050331673\000", !6, !7, !10} ; [ DW_TAG_arg_variable ] [incx] [line 25]
!17 = !{!"0x100\00smax\0037\000", !6, !7, !12}    ; [ DW_TAG_auto_variable ] [smax] [line 37]
!18 = !{!"0x100\00i\0038\000", !6, !7, !10}       ; [ DW_TAG_auto_variable ] [i] [line 38]
!19 = !{!"0x100\00istmp\0038\000", !6, !7, !10}   ; [ DW_TAG_auto_variable ] [istmp] [line 38]
!20 = !{!"0x2e\00saxpy\00saxpy\00\0069\000\001\000\000\000\001\0087", !1, !7, !21, null, void (i32, double, float*, i32, float*, i32)* @saxpy, null, null, !23} ; [ DW_TAG_subprogram ] [line 69] [def] [scope 87] [saxpy]
!21 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !22, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = !{null, !10, !12, !11, !10, !11, !10}
!23 = !{!24, !25, !26, !27, !28, !29, !30}
!24 = !{!"0x101\00n\0016777287\000", !20, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 71]
!25 = !{!"0x101\00sa\0033554502\000", !20, !7, !12} ; [ DW_TAG_arg_variable ] [sa] [line 70]
!26 = !{!"0x101\00sx\0050331718\000", !20, !7, !11} ; [ DW_TAG_arg_variable ] [sx] [line 70]
!27 = !{!"0x101\00incx\0067108935\000", !20, !7, !10} ; [ DW_TAG_arg_variable ] [incx] [line 71]
!28 = !{!"0x101\00sy\0083886150\000", !20, !7, !11} ; [ DW_TAG_arg_variable ] [sy] [line 70]
!29 = !{!"0x101\00incy\00100663367\000", !20, !7, !10} ; [ DW_TAG_arg_variable ] [incy] [line 71]
!30 = !{!"0x100\00i\0088\000", !20, !7, !10}      ; [ DW_TAG_auto_variable ] [i] [line 88]
!31 = !{!"0x2e\00saxpyx\00saxpyx\00\00112\000\001\000\000\000\001\00130", !1, !7, !21, null, void (i32, double, float*, i32, float*, i32)* @saxpyx, null, null, !32} ; [ DW_TAG_subprogram ] [line 112] [def] [scope 130] [saxpyx]
!32 = !{!33, !34, !35, !36, !37, !38, !39}
!33 = !{!"0x101\00n\0016777330\000", !31, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 114]
!34 = !{!"0x101\00sa\0033554545\000", !31, !7, !12} ; [ DW_TAG_arg_variable ] [sa] [line 113]
!35 = !{!"0x101\00sx\0050331761\000", !31, !7, !11} ; [ DW_TAG_arg_variable ] [sx] [line 113]
!36 = !{!"0x101\00incx\0067108978\000", !31, !7, !10} ; [ DW_TAG_arg_variable ] [incx] [line 114]
!37 = !{!"0x101\00sy\0083886193\000", !31, !7, !11} ; [ DW_TAG_arg_variable ] [sy] [line 113]
!38 = !{!"0x101\00incy\00100663410\000", !31, !7, !10} ; [ DW_TAG_arg_variable ] [incy] [line 114]
!39 = !{!"0x100\00i\00131\000", !31, !7, !10}     ; [ DW_TAG_auto_variable ] [i] [line 131]
!40 = !{!"0x2e\00scopy\00scopy\00\00155\000\001\000\000\000\001\00171", !1, !7, !41, null, void (i32, float*, i32, float*, i32)* @scopy, null, null, !43} ; [ DW_TAG_subprogram ] [line 155] [def] [scope 171] [scopy]
!41 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !42, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!42 = !{null, !10, !11, !10, !11, !10}
!43 = !{!44, !45, !46, !47, !48, !49}
!44 = !{!"0x101\00n\0016777373\000", !40, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 157]
!45 = !{!"0x101\00sx\0033554588\000", !40, !7, !11} ; [ DW_TAG_arg_variable ] [sx] [line 156]
!46 = !{!"0x101\00incx\0050331805\000", !40, !7, !10} ; [ DW_TAG_arg_variable ] [incx] [line 157]
!47 = !{!"0x101\00sy\0067109020\000", !40, !7, !11} ; [ DW_TAG_arg_variable ] [sy] [line 156]
!48 = !{!"0x101\00incy\0083886237\000", !40, !7, !10} ; [ DW_TAG_arg_variable ] [incy] [line 157]
!49 = !{!"0x100\00i\00172\000", !40, !7, !10}     ; [ DW_TAG_auto_variable ] [i] [line 172]
!50 = !{!"0x2e\00sdot\00sdot\00\00196\000\001\000\000\000\001\00214", !1, !7, !51, null, double (i32, float*, i32, float*, i32)* @sdot, null, null, !53} ; [ DW_TAG_subprogram ] [line 196] [def] [scope 214] [sdot]
!51 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !52, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!52 = !{!4, !10, !11, !10, !11, !10}
!53 = !{!54, !55, !56, !57, !58, !59, !60}
!54 = !{!"0x101\00n\0016777414\000", !50, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 198]
!55 = !{!"0x101\00sx\0033554629\000", !50, !7, !11} ; [ DW_TAG_arg_variable ] [sx] [line 197]
!56 = !{!"0x101\00incx\0050331846\000", !50, !7, !10} ; [ DW_TAG_arg_variable ] [incx] [line 198]
!57 = !{!"0x101\00sy\0067109061\000", !50, !7, !11} ; [ DW_TAG_arg_variable ] [sy] [line 197]
!58 = !{!"0x101\00incy\0083886278\000", !50, !7, !10} ; [ DW_TAG_arg_variable ] [incy] [line 198]
!59 = !{!"0x100\00i\00215\000", !50, !7, !10}     ; [ DW_TAG_auto_variable ] [i] [line 215]
!60 = !{!"0x100\00stemp\00216\000", !50, !7, !12} ; [ DW_TAG_auto_variable ] [stemp] [line 216]
!61 = !{!"0x2e\00snrm2\00snrm2\00\00241\000\001\000\000\000\001\00262", !1, !7, !62, null, double (i32, float*, i32)* @snrm2, null, null, !64} ; [ DW_TAG_subprogram ] [line 241] [def] [scope 262] [snrm2]
!62 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !63, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!63 = !{!4, !10, !11, !10}
!64 = !{!65, !66, !67, !68, !69, !70, !71, !72, !73, !74}
!65 = !{!"0x101\00n\0016777459\000", !61, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 243]
!66 = !{!"0x101\00sx\0033554674\000", !61, !7, !11} ; [ DW_TAG_arg_variable ] [sx] [line 242]
!67 = !{!"0x101\00incx\0050331891\000", !61, !7, !10} ; [ DW_TAG_arg_variable ] [incx] [line 243]
!68 = !{!"0x100\00i\00263\000", !61, !7, !10}     ; [ DW_TAG_auto_variable ] [i] [line 263]
!69 = !{!"0x100\00phase\00264\000", !61, !7, !10} ; [ DW_TAG_auto_variable ] [phase] [line 264]
!70 = !{!"0x100\00sum\00265\000", !61, !7, !4}    ; [ DW_TAG_auto_variable ] [sum] [line 265]
!71 = !{!"0x100\00cutlo\00265\000", !61, !7, !4}  ; [ DW_TAG_auto_variable ] [cutlo] [line 265]
!72 = !{!"0x100\00cuthi\00265\000", !61, !7, !4}  ; [ DW_TAG_auto_variable ] [cuthi] [line 265]
!73 = !{!"0x100\00hitst\00265\000", !61, !7, !4}  ; [ DW_TAG_auto_variable ] [hitst] [line 265]
!74 = !{!"0x100\00xmax\00266\000", !61, !7, !12}  ; [ DW_TAG_auto_variable ] [xmax] [line 266]
!75 = !{!"0x2e\00r1mach\00r1mach\00\00327\000\001\000\000\000\001\00334", !1, !7, !76, null, double ()* @r1mach, null, null, !77} ; [ DW_TAG_subprogram ] [line 327] [def] [scope 334] [r1mach]
!76 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !3, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!77 = !{!78, !79}
!78 = !{!"0x100\00u\00335\000", !75, !7, !12}     ; [ DW_TAG_auto_variable ] [u] [line 335]
!79 = !{!"0x100\00comp\00335\000", !75, !7, !12}  ; [ DW_TAG_auto_variable ] [comp] [line 335]
!80 = !{!"0x2e\00min0\00min0\00\00346\000\001\000\000\000\001\00359", !1, !7, !81, null, i32 (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32)* @min0, null, null, !83} ; [ DW_TAG_subprogram ] [line 346] [def] [scope 359] [min0]
!81 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !82, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!82 = !{!10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10}
!83 = !{!84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100}
!84 = !{!"0x101\00n\0016777574\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 358]
!85 = !{!"0x101\00a\0033554790\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [a] [line 358]
!86 = !{!"0x101\00b\0050332006\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [b] [line 358]
!87 = !{!"0x101\00c\0067109222\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [c] [line 358]
!88 = !{!"0x101\00d\0083886438\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [d] [line 358]
!89 = !{!"0x101\00e\00100663654\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [e] [line 358]
!90 = !{!"0x101\00f\00117440870\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [f] [line 358]
!91 = !{!"0x101\00g\00134218086\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [g] [line 358]
!92 = !{!"0x101\00h\00150995302\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [h] [line 358]
!93 = !{!"0x101\00i\00167772518\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [i] [line 358]
!94 = !{!"0x101\00j\00184549734\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [j] [line 358]
!95 = !{!"0x101\00k\00201326950\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [k] [line 358]
!96 = !{!"0x101\00l\00218104166\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [l] [line 358]
!97 = !{!"0x101\00m\00234881382\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [m] [line 358]
!98 = !{!"0x101\00o\00251658598\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [o] [line 358]
!99 = !{!"0x101\00p\00268435814\000", !80, !7, !10} ; [ DW_TAG_arg_variable ] [p] [line 358]
!100 = !{!"0x100\00mt\00360\000", !80, !7, !10}   ; [ DW_TAG_auto_variable ] [mt] [line 360]
!101 = !{!"0x2e\00sscal\00sscal\00\00408\000\001\000\000\000\001\00424", !1, !7, !102, null, i32 (i32, double, float*, i32)* @sscal, null, null, !104} ; [ DW_TAG_subprogram ] [line 408] [def] [scope 424] [sscal]
!102 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !103, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!103 = !{!10, !10, !12, !11, !10}
!104 = !{!105, !106, !107, !108, !109}
!105 = !{!"0x101\00n\0016777625\000", !101, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 409]
!106 = !{!"0x101\00sa\0033554842\000", !101, !7, !12} ; [ DW_TAG_arg_variable ] [sa] [line 410]
!107 = !{!"0x101\00sx\0050332058\000", !101, !7, !11} ; [ DW_TAG_arg_variable ] [sx] [line 410]
!108 = !{!"0x101\00incx\0067109273\000", !101, !7, !10} ; [ DW_TAG_arg_variable ] [incx] [line 409]
!109 = !{!"0x100\00i\00425\000", !101, !7, !10}   ; [ DW_TAG_auto_variable ] [i] [line 425]
!110 = !{!"0x2e\00vexopy\00vexopy\00\00441\000\001\000\000\000\001\00459", !1, !7, !111, null, void (i32, float*, float*, float*, i32)* @vexopy, null, null, !113} ; [ DW_TAG_subprogram ] [line 441] [def] [scope 459] [vexopy]
!111 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !112, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!112 = !{null, !10, !11, !11, !11, !10}
!113 = !{!114, !115, !116, !117, !118, !119}
!114 = !{!"0x101\00n\0016777658\000", !110, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 442]
!115 = !{!"0x101\00v\0033554875\000", !110, !7, !11} ; [ DW_TAG_arg_variable ] [v] [line 443]
!116 = !{!"0x101\00x\0050332091\000", !110, !7, !11} ; [ DW_TAG_arg_variable ] [x] [line 443]
!117 = !{!"0x101\00y\0067109307\000", !110, !7, !11} ; [ DW_TAG_arg_variable ] [y] [line 443]
!118 = !{!"0x101\00itype\0083886522\000", !110, !7, !10} ; [ DW_TAG_arg_variable ] [itype] [line 442]
!119 = !{!"0x100\00i\00460\000", !110, !7, !10}   ; [ DW_TAG_auto_variable ] [i] [line 460]
!120 = !{!"0x2e\00vfill\00vfill\00\00471\000\001\000\000\000\001\00481", !1, !7, !121, null, void (i32, float*, double)* @vfill, null, null, !123} ; [ DW_TAG_subprogram ] [line 471] [def] [scope 481] [vfill]
!121 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !122, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!122 = !{null, !10, !11, !12}
!123 = !{!124, !125, !126, !127}
!124 = !{!"0x101\00n\0016777688\000", !120, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 472]
!125 = !{!"0x101\00v\0033554905\000", !120, !7, !11} ; [ DW_TAG_arg_variable ] [v] [line 473]
!126 = !{!"0x101\00val\0050332121\000", !120, !7, !12} ; [ DW_TAG_arg_variable ] [val] [line 473]
!127 = !{!"0x100\00i\00482\000", !120, !7, !10}   ; [ DW_TAG_auto_variable ] [i] [line 482]
!128 = !{i32 2, !"Dwarf Version", i32 4}
!129 = !{i32 2, !"Debug Info Version", i32 2}
!130 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!131 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!132 = !MDLocation(line: 25, column: 5, scope: !6)
!133 = !MDLocation(line: 24, column: 8, scope: !6)
!134 = !MDLocation(line: 25, column: 8, scope: !6)
!135 = !MDLocation(line: 37, column: 9, scope: !6)
!136 = !MDLocation(line: 38, column: 10, scope: !6)
!137 = !MDLocation(line: 43, column: 7, scope: !138)
!138 = !{!"0xb\0043\007\000", !1, !6}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!139 = !MDLocation(line: 43, column: 7, scope: !6)
!140 = !MDLocation(line: 44, column: 7, scope: !141)
!141 = !{!"0xb\0044\007\001", !1, !6}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!142 = !MDLocation(line: 44, column: 7, scope: !6)
!143 = !MDLocation(line: 46, column: 9, scope: !144)
!144 = !{!"0xb\0046\009\003", !1, !145}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!145 = !{!"0xb\0044\0019\002", !1, !141}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!146 = !MDLocation(line: 46, column: 9, scope: !145)
!147 = !MDLocation(line: 46, column: 32, scope: !144)
!148 = !MDLocation(line: 46, column: 31, scope: !144)
!149 = !MDLocation(line: 46, column: 25, scope: !144)
!150 = !MDLocation(line: 46, column: 20, scope: !144)
!151 = !MDLocation(line: 48, column: 13, scope: !145)
!152 = !{!153, !153, i64 0}
!153 = !{!"float", !154, i64 0}
!154 = !{!"omnipotent char", !155, i64 0}
!155 = !{!"Simple C/C++ TBAA"}
!156 = !MDLocation(line: 48, column: 13, scope: !157)
!157 = !{!"0xb\002", !1, !145}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!158 = !MDLocation(line: 49, column: 5, scope: !145)
!159 = !MDLocation(line: 38, column: 7, scope: !6)
!160 = !MDLocation(line: 50, column: 5, scope: !161)
!161 = !{!"0xb\0050\005\004", !1, !145}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!162 = !MDLocation(line: 51, column: 11, scope: !163)
!163 = !{!"0xb\0051\0011\006", !1, !164}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!164 = !{!"0xb\0050\005\005", !1, !161}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!165 = !MDLocation(line: 51, column: 11, scope: !166)
!166 = !{!"0xb\002", !1, !163}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!167 = !MDLocation(line: 51, column: 11, scope: !164)
!168 = !MDLocation(line: 53, column: 10, scope: !169)
!169 = !{!"0xb\0051\0031\007", !1, !163}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!170 = !MDLocation(line: 53, column: 10, scope: !171)
!171 = !{!"0xb\002", !1, !169}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!172 = !MDLocation(line: 50, column: 20, scope: !164)
!173 = !MDLocation(line: 59, column: 11, scope: !6)
!174 = !MDLocation(line: 59, column: 11, scope: !175)
!175 = !{!"0xb\002", !1, !6}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!176 = !MDLocation(line: 61, column: 3, scope: !177)
!177 = !{!"0xb\0061\003\008", !1, !6}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!178 = !MDLocation(line: 60, column: 3, scope: !6)
!179 = !MDLocation(line: 62, column: 9, scope: !180)
!180 = !{!"0xb\0062\009\0010", !1, !181}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!181 = !{!"0xb\0061\003\009", !1, !177}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!182 = !MDLocation(line: 62, column: 9, scope: !183)
!183 = !{!"0xb\002", !1, !180}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!184 = !MDLocation(line: 62, column: 9, scope: !181)
!185 = !MDLocation(line: 64, column: 15, scope: !186)
!186 = !{!"0xb\0062\0029\0011", !1, !180}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!187 = !MDLocation(line: 64, column: 15, scope: !188)
!188 = !{!"0xb\002", !1, !186}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!189 = !MDLocation(line: 61, column: 18, scope: !181)
!190 = !MDLocation(line: 67, column: 1, scope: !6)
!191 = !MDLocation(line: 71, column: 7, scope: !20)
!192 = !MDLocation(line: 70, column: 17, scope: !20)
!193 = !MDLocation(line: 70, column: 8, scope: !20)
!194 = !MDLocation(line: 71, column: 10, scope: !20)
!195 = !MDLocation(line: 70, column: 13, scope: !20)
!196 = !MDLocation(line: 71, column: 16, scope: !20)
!197 = !MDLocation(line: 90, column: 7, scope: !198)
!198 = !{!"0xb\0090\007\0012", !1, !20}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!199 = !MDLocation(line: 90, column: 15, scope: !200)
!200 = !{!"0xb\002", !1, !198}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!201 = !MDLocation(line: 90, column: 7, scope: !20)
!202 = !MDLocation(line: 91, column: 7, scope: !203)
!203 = !{!"0xb\0091\007\0013", !1, !20}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!204 = !MDLocation(line: 91, column: 7, scope: !20)
!205 = !MDLocation(line: 92, column: 9, scope: !206)
!206 = !{!"0xb\0092\009\0015", !1, !207}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!207 = !{!"0xb\0091\0022\0014", !1, !203}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!208 = !MDLocation(line: 92, column: 9, scope: !207)
!209 = !MDLocation(line: 94, column: 17, scope: !210)
!210 = !{!"0xb\0094\007\0018", !1, !211}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!211 = !{!"0xb\0094\007\0017", !1, !212}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!212 = !{!"0xb\0092\0021\0016", !1, !206}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!213 = !MDLocation(line: 94, column: 7, scope: !211)
!214 = !MDLocation(line: 95, column: 13, scope: !210)
!215 = !MDLocation(line: 95, column: 9, scope: !210)
!216 = !MDLocation(line: 95, column: 2, scope: !210)
!217 = !MDLocation(line: 94, column: 22, scope: !210)
!218 = !MDLocation(line: 88, column: 16, scope: !20)
!219 = !MDLocation(line: 94, column: 26, scope: !210)
!220 = !MDLocation(line: 94, column: 31, scope: !210)
!221 = !MDLocation(line: 98, column: 9, scope: !222)
!222 = !{!"0xb\0098\009\0019", !1, !207}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!223 = !MDLocation(line: 98, column: 9, scope: !207)
!224 = !MDLocation(line: 100, column: 17, scope: !225)
!225 = !{!"0xb\00100\007\0022", !1, !226}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!226 = !{!"0xb\00100\007\0021", !1, !227}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!227 = !{!"0xb\0098\0018\0020", !1, !222}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!228 = !MDLocation(line: 100, column: 7, scope: !226)
!229 = !MDLocation(line: 100, column: 26, scope: !225)
!230 = !MDLocation(line: 101, column: 13, scope: !225)
!231 = !MDLocation(line: 101, column: 9, scope: !225)
!232 = !MDLocation(line: 101, column: 2, scope: !225)
!233 = !MDLocation(line: 100, column: 22, scope: !225)
!234 = !MDLocation(line: 100, column: 35, scope: !225)
!235 = !MDLocation(line: 106, column: 7, scope: !236)
!236 = !{!"0xb\00106\007\0023", !1, !20}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!237 = !MDLocation(line: 106, column: 7, scope: !20)
!238 = !MDLocation(line: 106, column: 26, scope: !236)
!239 = !MDLocation(line: 106, column: 25, scope: !236)
!240 = !MDLocation(line: 106, column: 18, scope: !236)
!241 = !MDLocation(line: 107, column: 7, scope: !242)
!242 = !{!"0xb\00107\007\0024", !1, !20}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!243 = !MDLocation(line: 107, column: 7, scope: !20)
!244 = !MDLocation(line: 107, column: 26, scope: !242)
!245 = !MDLocation(line: 107, column: 25, scope: !242)
!246 = !MDLocation(line: 107, column: 18, scope: !242)
!247 = !MDLocation(line: 108, column: 13, scope: !248)
!248 = !{!"0xb\00108\003\0026", !1, !249}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!249 = !{!"0xb\00108\003\0025", !1, !20}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!250 = !MDLocation(line: 108, column: 3, scope: !249)
!251 = !MDLocation(line: 108, column: 22, scope: !248)
!252 = !MDLocation(line: 108, column: 31, scope: !248)
!253 = !MDLocation(line: 109, column: 16, scope: !248)
!254 = !MDLocation(line: 109, column: 12, scope: !248)
!255 = !MDLocation(line: 109, column: 5, scope: !248)
!256 = !MDLocation(line: 108, column: 18, scope: !248)
!257 = !MDLocation(line: 110, column: 1, scope: !20)
!258 = !MDLocation(line: 114, column: 7, scope: !31)
!259 = !MDLocation(line: 113, column: 17, scope: !31)
!260 = !MDLocation(line: 113, column: 8, scope: !31)
!261 = !MDLocation(line: 114, column: 10, scope: !31)
!262 = !MDLocation(line: 113, column: 13, scope: !31)
!263 = !MDLocation(line: 114, column: 16, scope: !31)
!264 = !MDLocation(line: 133, column: 7, scope: !265)
!265 = !{!"0xb\00133\007\0027", !1, !31}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!266 = !MDLocation(line: 133, column: 15, scope: !267)
!267 = !{!"0xb\002", !1, !265}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!268 = !MDLocation(line: 133, column: 7, scope: !31)
!269 = !MDLocation(line: 134, column: 7, scope: !270)
!270 = !{!"0xb\00134\007\0028", !1, !31}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!271 = !MDLocation(line: 134, column: 7, scope: !31)
!272 = !MDLocation(line: 135, column: 9, scope: !273)
!273 = !{!"0xb\00135\009\0030", !1, !274}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!274 = !{!"0xb\00134\0022\0029", !1, !270}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!275 = !MDLocation(line: 135, column: 9, scope: !274)
!276 = !MDLocation(line: 137, column: 17, scope: !277)
!277 = !{!"0xb\00137\007\0033", !1, !278}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!278 = !{!"0xb\00137\007\0032", !1, !279}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!279 = !{!"0xb\00135\0021\0031", !1, !273}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!280 = !MDLocation(line: 137, column: 7, scope: !278)
!281 = !MDLocation(line: 138, column: 8, scope: !277)
!282 = !MDLocation(line: 138, column: 18, scope: !277)
!283 = !MDLocation(line: 138, column: 14, scope: !277)
!284 = !MDLocation(line: 138, column: 2, scope: !277)
!285 = !MDLocation(line: 137, column: 22, scope: !277)
!286 = !MDLocation(line: 131, column: 12, scope: !31)
!287 = !MDLocation(line: 137, column: 27, scope: !277)
!288 = !MDLocation(line: 137, column: 33, scope: !277)
!289 = !MDLocation(line: 141, column: 9, scope: !290)
!290 = !{!"0xb\00141\009\0034", !1, !274}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!291 = !MDLocation(line: 141, column: 9, scope: !274)
!292 = !MDLocation(line: 143, column: 17, scope: !293)
!293 = !{!"0xb\00143\007\0037", !1, !294}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!294 = !{!"0xb\00143\007\0036", !1, !295}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!295 = !{!"0xb\00141\0018\0035", !1, !290}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!296 = !MDLocation(line: 143, column: 7, scope: !294)
!297 = !MDLocation(line: 143, column: 27, scope: !293)
!298 = !MDLocation(line: 144, column: 8, scope: !293)
!299 = !MDLocation(line: 144, column: 18, scope: !293)
!300 = !MDLocation(line: 144, column: 14, scope: !293)
!301 = !MDLocation(line: 144, column: 2, scope: !293)
!302 = !MDLocation(line: 143, column: 22, scope: !293)
!303 = !MDLocation(line: 143, column: 37, scope: !293)
!304 = !MDLocation(line: 149, column: 7, scope: !305)
!305 = !{!"0xb\00149\007\0038", !1, !31}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!306 = !MDLocation(line: 149, column: 7, scope: !31)
!307 = !MDLocation(line: 149, column: 26, scope: !305)
!308 = !MDLocation(line: 149, column: 25, scope: !305)
!309 = !MDLocation(line: 149, column: 18, scope: !305)
!310 = !MDLocation(line: 150, column: 7, scope: !311)
!311 = !{!"0xb\00150\007\0039", !1, !31}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!312 = !MDLocation(line: 150, column: 7, scope: !31)
!313 = !MDLocation(line: 150, column: 26, scope: !311)
!314 = !MDLocation(line: 150, column: 25, scope: !311)
!315 = !MDLocation(line: 150, column: 18, scope: !311)
!316 = !MDLocation(line: 151, column: 13, scope: !317)
!317 = !{!"0xb\00151\003\0041", !1, !318}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!318 = !{!"0xb\00151\003\0040", !1, !31}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!319 = !MDLocation(line: 151, column: 3, scope: !318)
!320 = !MDLocation(line: 151, column: 22, scope: !317)
!321 = !MDLocation(line: 151, column: 31, scope: !317)
!322 = !MDLocation(line: 152, column: 11, scope: !317)
!323 = !MDLocation(line: 152, column: 21, scope: !317)
!324 = !MDLocation(line: 152, column: 17, scope: !317)
!325 = !MDLocation(line: 152, column: 5, scope: !317)
!326 = !MDLocation(line: 151, column: 18, scope: !317)
!327 = !MDLocation(line: 153, column: 1, scope: !31)
!328 = !MDLocation(line: 157, column: 9, scope: !40)
!329 = !MDLocation(line: 156, column: 9, scope: !40)
!330 = !MDLocation(line: 157, column: 12, scope: !40)
!331 = !MDLocation(line: 156, column: 14, scope: !40)
!332 = !MDLocation(line: 157, column: 18, scope: !40)
!333 = !MDLocation(line: 174, column: 7, scope: !334)
!334 = !{!"0xb\00174\007\0042", !1, !40}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!335 = !MDLocation(line: 174, column: 7, scope: !40)
!336 = !MDLocation(line: 175, column: 7, scope: !337)
!337 = !{!"0xb\00175\007\0043", !1, !40}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!338 = !MDLocation(line: 175, column: 7, scope: !40)
!339 = !MDLocation(line: 176, column: 9, scope: !340)
!340 = !{!"0xb\00176\009\0045", !1, !341}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!341 = !{!"0xb\00175\0022\0044", !1, !337}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!342 = !MDLocation(line: 176, column: 9, scope: !341)
!343 = !MDLocation(line: 178, column: 7, scope: !344)
!344 = !{!"0xb\00178\007\0047", !1, !345}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!345 = !{!"0xb\00176\0021\0046", !1, !340}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!346 = !MDLocation(line: 179, column: 14, scope: !347)
!347 = !{!"0xb\00178\007\0048", !1, !344}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!348 = !MDLocation(line: 179, column: 12, scope: !347)
!349 = !MDLocation(line: 179, column: 4, scope: !347)
!350 = !MDLocation(line: 179, column: 2, scope: !347)
!351 = !MDLocation(line: 178, column: 22, scope: !347)
!352 = !MDLocation(line: 172, column: 16, scope: !40)
!353 = !MDLocation(line: 182, column: 9, scope: !354)
!354 = !{!"0xb\00182\009\0049", !1, !341}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!355 = !MDLocation(line: 182, column: 9, scope: !341)
!356 = !MDLocation(line: 184, column: 27, scope: !357)
!357 = !{!"0xb\00184\007\0052", !1, !358}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!358 = !{!"0xb\00184\007\0051", !1, !359}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!359 = !{!"0xb\00182\0020\0050", !1, !354}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!360 = !MDLocation(line: 184, column: 7, scope: !358)
!361 = !MDLocation(line: 185, column: 8, scope: !357)
!362 = !MDLocation(line: 185, column: 2, scope: !357)
!363 = !MDLocation(line: 184, column: 22, scope: !357)
!364 = !MDLocation(line: 184, column: 37, scope: !357)
!365 = !MDLocation(line: 190, column: 7, scope: !366)
!366 = !{!"0xb\00190\007\0053", !1, !40}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!367 = !MDLocation(line: 190, column: 7, scope: !40)
!368 = !MDLocation(line: 190, column: 26, scope: !366)
!369 = !MDLocation(line: 190, column: 25, scope: !366)
!370 = !MDLocation(line: 190, column: 18, scope: !366)
!371 = !MDLocation(line: 191, column: 7, scope: !372)
!372 = !{!"0xb\00191\007\0054", !1, !40}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!373 = !MDLocation(line: 191, column: 7, scope: !40)
!374 = !MDLocation(line: 191, column: 26, scope: !372)
!375 = !MDLocation(line: 191, column: 25, scope: !372)
!376 = !MDLocation(line: 191, column: 18, scope: !372)
!377 = !MDLocation(line: 192, column: 22, scope: !378)
!378 = !{!"0xb\00192\003\0056", !1, !379}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!379 = !{!"0xb\00192\003\0055", !1, !40}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!380 = !MDLocation(line: 192, column: 31, scope: !378)
!381 = !MDLocation(line: 192, column: 3, scope: !379)
!382 = !MDLocation(line: 193, column: 14, scope: !378)
!383 = !MDLocation(line: 193, column: 5, scope: !378)
!384 = !MDLocation(line: 192, column: 18, scope: !378)
!385 = !MDLocation(line: 195, column: 1, scope: !40)
!386 = !MDLocation(line: 198, column: 5, scope: !50)
!387 = !MDLocation(line: 197, column: 8, scope: !50)
!388 = !MDLocation(line: 198, column: 8, scope: !50)
!389 = !MDLocation(line: 197, column: 13, scope: !50)
!390 = !MDLocation(line: 198, column: 14, scope: !50)
!391 = !MDLocation(line: 216, column: 9, scope: !50)
!392 = !MDLocation(line: 218, column: 7, scope: !393)
!393 = !{!"0xb\00218\007\0057", !1, !50}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!394 = !MDLocation(line: 218, column: 7, scope: !50)
!395 = !MDLocation(line: 219, column: 7, scope: !396)
!396 = !{!"0xb\00219\007\0058", !1, !50}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!397 = !MDLocation(line: 219, column: 7, scope: !50)
!398 = !MDLocation(line: 220, column: 9, scope: !399)
!399 = !{!"0xb\00220\009\0060", !1, !400}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!400 = !{!"0xb\00219\0022\0059", !1, !396}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!401 = !MDLocation(line: 220, column: 9, scope: !400)
!402 = !MDLocation(line: 222, column: 7, scope: !403)
!403 = !{!"0xb\00222\007\0062", !1, !404}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!404 = !{!"0xb\00220\0021\0061", !1, !399}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!405 = !MDLocation(line: 223, column: 12, scope: !406)
!406 = !{!"0xb\00222\007\0063", !1, !403}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!407 = !MDLocation(line: 223, column: 18, scope: !406)
!408 = !MDLocation(line: 223, column: 11, scope: !406)
!409 = !MDLocation(line: 223, column: 2, scope: !406)
!410 = !MDLocation(line: 222, column: 22, scope: !406)
!411 = !MDLocation(line: 215, column: 12, scope: !50)
!412 = !MDLocation(line: 222, column: 27, scope: !406)
!413 = !MDLocation(line: 222, column: 33, scope: !406)
!414 = !MDLocation(line: 224, column: 7, scope: !404)
!415 = !MDLocation(line: 226, column: 9, scope: !416)
!416 = !{!"0xb\00226\009\0064", !1, !400}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!417 = !MDLocation(line: 226, column: 9, scope: !400)
!418 = !MDLocation(line: 228, column: 27, scope: !419)
!419 = !{!"0xb\00228\007\0067", !1, !420}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!420 = !{!"0xb\00228\007\0066", !1, !421}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!421 = !{!"0xb\00226\0018\0065", !1, !416}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!422 = !MDLocation(line: 228, column: 7, scope: !420)
!423 = !MDLocation(line: 229, column: 12, scope: !419)
!424 = !MDLocation(line: 229, column: 18, scope: !419)
!425 = !MDLocation(line: 229, column: 11, scope: !419)
!426 = !MDLocation(line: 229, column: 2, scope: !419)
!427 = !MDLocation(line: 228, column: 22, scope: !419)
!428 = !MDLocation(line: 228, column: 37, scope: !419)
!429 = !MDLocation(line: 230, column: 7, scope: !421)
!430 = !MDLocation(line: 234, column: 7, scope: !431)
!431 = !{!"0xb\00234\007\0068", !1, !50}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!432 = !MDLocation(line: 234, column: 7, scope: !50)
!433 = !MDLocation(line: 234, column: 26, scope: !431)
!434 = !MDLocation(line: 234, column: 25, scope: !431)
!435 = !MDLocation(line: 234, column: 18, scope: !431)
!436 = !MDLocation(line: 235, column: 7, scope: !437)
!437 = !{!"0xb\00235\007\0069", !1, !50}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!438 = !MDLocation(line: 235, column: 7, scope: !50)
!439 = !MDLocation(line: 235, column: 26, scope: !437)
!440 = !MDLocation(line: 235, column: 25, scope: !437)
!441 = !MDLocation(line: 235, column: 18, scope: !437)
!442 = !MDLocation(line: 236, column: 22, scope: !443)
!443 = !{!"0xb\00236\003\0071", !1, !444}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!444 = !{!"0xb\00236\003\0070", !1, !50}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!445 = !MDLocation(line: 236, column: 31, scope: !443)
!446 = !MDLocation(line: 236, column: 3, scope: !444)
!447 = !MDLocation(line: 237, column: 15, scope: !443)
!448 = !MDLocation(line: 237, column: 21, scope: !443)
!449 = !MDLocation(line: 237, column: 14, scope: !443)
!450 = !MDLocation(line: 237, column: 5, scope: !443)
!451 = !MDLocation(line: 236, column: 18, scope: !443)
!452 = !MDLocation(line: 238, column: 3, scope: !50)
!453 = !MDLocation(line: 239, column: 1, scope: !50)
!454 = !MDLocation(line: 243, column: 5, scope: !61)
!455 = !MDLocation(line: 242, column: 8, scope: !61)
!456 = !MDLocation(line: 243, column: 8, scope: !61)
!457 = !MDLocation(line: 264, column: 8, scope: !61)
!458 = !MDLocation(line: 265, column: 10, scope: !61)
!459 = !MDLocation(line: 268, column: 7, scope: !460)
!460 = !{!"0xb\00268\007\0072", !1, !61}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!461 = !MDLocation(line: 268, column: 14, scope: !462)
!462 = !{!"0xb\002", !1, !460}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!463 = !MDLocation(line: 268, column: 7, scope: !61)
!464 = !MDLocation(line: 270, column: 25, scope: !61)
!465 = !MDLocation(line: 270, column: 17, scope: !61)
!466 = !MDLocation(line: 270, column: 11, scope: !61)
!467 = !MDLocation(line: 265, column: 23, scope: !61)
!468 = !MDLocation(line: 265, column: 30, scope: !61)
!469 = !MDLocation(line: 272, column: 17, scope: !61)
!470 = !MDLocation(line: 272, column: 11, scope: !61)
!471 = !MDLocation(line: 265, column: 37, scope: !61)
!472 = !MDLocation(line: 263, column: 16, scope: !61)
!473 = !MDLocation(line: 276, column: 10, scope: !61)
!474 = !MDLocation(line: 278, column: 5, scope: !475)
!475 = !{!"0xb\00276\0032\0073", !1, !61}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!476 = !MDLocation(line: 276, column: 19, scope: !61)
!477 = !MDLocation(line: 276, column: 3, scope: !478)
!478 = !{!"0xb\003", !1, !61}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!479 = !MDLocation(line: 293, column: 5, scope: !480)
!480 = !{!"0xb\00291\008\0081", !1, !481}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!481 = !{!"0xb\00283\007\0075", !1, !61}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!482 = !MDLocation(line: 283, column: 7, scope: !481)
!483 = !MDLocation(line: 277, column: 5, scope: !475)
!484 = !MDLocation(line: 283, column: 7, scope: !485)
!485 = !{!"0xb\002", !1, !481}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!486 = !MDLocation(line: 283, column: 7, scope: !487)
!487 = !{!"0xb\004", !1, !488}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!488 = !{!"0xb\003", !1, !481}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!489 = !MDLocation(line: 283, column: 7, scope: !61)
!490 = !MDLocation(line: 284, column: 12, scope: !491)
!491 = !{!"0xb\00284\005\0078", !1, !492}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!492 = !{!"0xb\00284\005\0077", !1, !493}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!493 = !{!"0xb\00283\0028\0076", !1, !481}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!494 = !MDLocation(line: 284, column: 5, scope: !492)
!495 = !MDLocation(line: 284, column: 22, scope: !491)
!496 = !MDLocation(line: 285, column: 11, scope: !497)
!497 = !{!"0xb\00285\0011\0080", !1, !498}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!498 = !{!"0xb\00284\0033\0079", !1, !491}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!499 = !MDLocation(line: 285, column: 11, scope: !500)
!500 = !{!"0xb\002", !1, !497}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!501 = !MDLocation(line: 312, column: 22, scope: !61)
!502 = !MDLocation(line: 285, column: 11, scope: !503)
!503 = !{!"0xb\004", !1, !504}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!504 = !{!"0xb\003", !1, !497}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!505 = !MDLocation(line: 285, column: 11, scope: !498)
!506 = !MDLocation(line: 286, column: 14, scope: !498)
!507 = !MDLocation(line: 286, column: 7, scope: !498)
!508 = !MDLocation(line: 284, column: 17, scope: !491)
!509 = !MDLocation(line: 288, column: 11, scope: !493)
!510 = !MDLocation(line: 289, column: 5, scope: !493)
!511 = !MDLocation(line: 292, column: 13, scope: !480)
!512 = !MDLocation(line: 292, column: 13, scope: !513)
!513 = !{!"0xb\002", !1, !480}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!514 = !MDLocation(line: 266, column: 9, scope: !61)
!515 = !MDLocation(line: 295, column: 5, scope: !480)
!516 = !MDLocation(line: 294, column: 5, scope: !480)
!517 = !MDLocation(line: 296, column: 12, scope: !518)
!518 = !{!"0xb\00296\005\0083", !1, !519}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!519 = !{!"0xb\00296\005\0082", !1, !480}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!520 = !MDLocation(line: 296, column: 5, scope: !519)
!521 = !MDLocation(line: 297, column: 11, scope: !522)
!522 = !{!"0xb\00297\0011\0085", !1, !523}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!523 = !{!"0xb\00296\0033\0084", !1, !518}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!524 = !MDLocation(line: 297, column: 11, scope: !525)
!525 = !{!"0xb\002", !1, !522}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!526 = !MDLocation(line: 297, column: 11, scope: !527)
!527 = !{!"0xb\004", !1, !528}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!528 = !{!"0xb\003", !1, !522}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!529 = !MDLocation(line: 297, column: 11, scope: !523)
!530 = !MDLocation(line: 298, column: 13, scope: !531)
!531 = !{!"0xb\00297\0032\0086", !1, !522}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!532 = !MDLocation(line: 298, column: 9, scope: !531)
!533 = !MDLocation(line: 298, column: 8, scope: !531)
!534 = !MDLocation(line: 299, column: 2, scope: !531)
!535 = !MDLocation(line: 301, column: 11, scope: !536)
!536 = !{!"0xb\00301\0011\0087", !1, !523}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!537 = !MDLocation(line: 301, column: 11, scope: !538)
!538 = !{!"0xb\002", !1, !536}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!539 = !MDLocation(line: 302, column: 27, scope: !540)
!540 = !{!"0xb\00301\0031\0088", !1, !536}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!541 = !MDLocation(line: 301, column: 11, scope: !523)
!542 = !MDLocation(line: 302, column: 20, scope: !540)
!543 = !MDLocation(line: 302, column: 19, scope: !540)
!544 = !MDLocation(line: 302, column: 15, scope: !540)
!545 = !MDLocation(line: 302, column: 9, scope: !540)
!546 = !MDLocation(line: 303, column: 9, scope: !540)
!547 = !MDLocation(line: 303, column: 9, scope: !548)
!548 = !{!"0xb\002", !1, !540}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!549 = !MDLocation(line: 306, column: 15, scope: !523)
!550 = !MDLocation(line: 306, column: 14, scope: !523)
!551 = !MDLocation(line: 306, column: 7, scope: !523)
!552 = !MDLocation(line: 308, column: 13, scope: !480)
!553 = !MDLocation(line: 308, column: 26, scope: !480)
!554 = !MDLocation(line: 308, column: 5, scope: !480)
!555 = !MDLocation(line: 312, column: 21, scope: !61)
!556 = !MDLocation(line: 312, column: 17, scope: !61)
!557 = !MDLocation(line: 312, column: 16, scope: !61)
!558 = !MDLocation(line: 312, column: 10, scope: !61)
!559 = !MDLocation(line: 313, column: 10, scope: !61)
!560 = !MDLocation(line: 313, column: 10, scope: !561)
!561 = !{!"0xb\002", !1, !61}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!562 = !MDLocation(line: 314, column: 3, scope: !61)
!563 = !MDLocation(line: 315, column: 3, scope: !61)
!564 = !MDLocation(line: 316, column: 10, scope: !565)
!565 = !{!"0xb\00316\003\0090", !1, !566}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!566 = !{!"0xb\00316\003\0089", !1, !61}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!567 = !MDLocation(line: 316, column: 3, scope: !566)
!568 = !MDLocation(line: 317, column: 9, scope: !569)
!569 = !{!"0xb\00317\009\0092", !1, !570}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!570 = !{!"0xb\00316\0031\0091", !1, !565}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!571 = !MDLocation(line: 317, column: 9, scope: !572)
!572 = !{!"0xb\002", !1, !569}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!573 = !MDLocation(line: 318, column: 32, scope: !574)
!574 = !{!"0xb\00317\0029\0093", !1, !569}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!575 = !MDLocation(line: 317, column: 9, scope: !570)
!576 = !MDLocation(line: 318, column: 25, scope: !574)
!577 = !MDLocation(line: 318, column: 24, scope: !574)
!578 = !MDLocation(line: 318, column: 20, scope: !574)
!579 = !MDLocation(line: 318, column: 14, scope: !574)
!580 = !MDLocation(line: 319, column: 14, scope: !574)
!581 = !MDLocation(line: 319, column: 14, scope: !582)
!582 = !{!"0xb\002", !1, !574}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!583 = !MDLocation(line: 322, column: 13, scope: !570)
!584 = !MDLocation(line: 322, column: 12, scope: !570)
!585 = !MDLocation(line: 322, column: 5, scope: !570)
!586 = !MDLocation(line: 324, column: 11, scope: !61)
!587 = !MDLocation(line: 324, column: 24, scope: !61)
!588 = !MDLocation(line: 324, column: 3, scope: !61)
!589 = !MDLocation(line: 325, column: 1, scope: !61)
!590 = !MDLocation(line: 335, column: 11, scope: !75)
!591 = !MDLocation(line: 337, column: 5, scope: !75)
!592 = !MDLocation(line: 338, column: 9, scope: !593)
!593 = !{!"0xb\00337\008\0094", !1, !75}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!594 = !MDLocation(line: 339, column: 16, scope: !593)
!595 = !MDLocation(line: 335, column: 22, scope: !75)
!596 = !MDLocation(line: 341, column: 12, scope: !75)
!597 = !MDLocation(line: 340, column: 5, scope: !593)
!598 = !MDLocation(line: 339, column: 24, scope: !593)
!599 = !MDLocation(line: 342, column: 13, scope: !75)
!600 = !MDLocation(line: 342, column: 5, scope: !75)
!601 = !MDLocation(line: 358, column: 5, scope: !80)
!602 = !MDLocation(line: 358, column: 8, scope: !80)
!603 = !MDLocation(line: 358, column: 11, scope: !80)
!604 = !MDLocation(line: 358, column: 14, scope: !80)
!605 = !MDLocation(line: 358, column: 17, scope: !80)
!606 = !MDLocation(line: 358, column: 20, scope: !80)
!607 = !MDLocation(line: 358, column: 23, scope: !80)
!608 = !MDLocation(line: 358, column: 26, scope: !80)
!609 = !MDLocation(line: 358, column: 29, scope: !80)
!610 = !MDLocation(line: 358, column: 32, scope: !80)
!611 = !MDLocation(line: 358, column: 35, scope: !80)
!612 = !MDLocation(line: 358, column: 38, scope: !80)
!613 = !MDLocation(line: 358, column: 41, scope: !80)
!614 = !MDLocation(line: 358, column: 44, scope: !80)
!615 = !MDLocation(line: 358, column: 47, scope: !80)
!616 = !MDLocation(line: 358, column: 50, scope: !80)
!617 = !MDLocation(line: 362, column: 9, scope: !80)
!618 = !MDLocation(line: 360, column: 9, scope: !80)
!619 = !MDLocation(line: 364, column: 9, scope: !620)
!620 = !{!"0xb\00364\009\0096", !1, !80}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!621 = !MDLocation(line: 364, column: 9, scope: !80)
!622 = !MDLocation(line: 366, column: 9, scope: !623)
!623 = !{!"0xb\00366\009\0097", !1, !80}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!624 = !MDLocation(line: 366, column: 9, scope: !80)
!625 = !MDLocation(line: 367, column: 9, scope: !626)
!626 = !{!"0xb\00367\009\0098", !1, !80}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!627 = !MDLocation(line: 367, column: 9, scope: !80)
!628 = !MDLocation(line: 369, column: 9, scope: !629)
!629 = !{!"0xb\00369\009\0099", !1, !80}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!630 = !MDLocation(line: 369, column: 9, scope: !80)
!631 = !MDLocation(line: 370, column: 9, scope: !632)
!632 = !{!"0xb\00370\009\00100", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!633 = !MDLocation(line: 370, column: 9, scope: !80)
!634 = !MDLocation(line: 372, column: 9, scope: !635)
!635 = !{!"0xb\00372\009\00101", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!636 = !MDLocation(line: 372, column: 9, scope: !80)
!637 = !MDLocation(line: 373, column: 9, scope: !638)
!638 = !{!"0xb\00373\009\00102", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!639 = !MDLocation(line: 373, column: 9, scope: !80)
!640 = !MDLocation(line: 375, column: 9, scope: !641)
!641 = !{!"0xb\00375\009\00103", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!642 = !MDLocation(line: 375, column: 9, scope: !80)
!643 = !MDLocation(line: 376, column: 9, scope: !644)
!644 = !{!"0xb\00376\009\00104", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!645 = !MDLocation(line: 376, column: 9, scope: !80)
!646 = !MDLocation(line: 378, column: 9, scope: !647)
!647 = !{!"0xb\00378\009\00105", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!648 = !MDLocation(line: 378, column: 9, scope: !80)
!649 = !MDLocation(line: 379, column: 9, scope: !650)
!650 = !{!"0xb\00379\009\00106", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!651 = !MDLocation(line: 379, column: 9, scope: !80)
!652 = !MDLocation(line: 381, column: 9, scope: !653)
!653 = !{!"0xb\00381\009\00107", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!654 = !MDLocation(line: 381, column: 9, scope: !80)
!655 = !MDLocation(line: 382, column: 9, scope: !656)
!656 = !{!"0xb\00382\009\00108", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!657 = !MDLocation(line: 382, column: 9, scope: !80)
!658 = !MDLocation(line: 384, column: 9, scope: !659)
!659 = !{!"0xb\00384\009\00109", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!660 = !MDLocation(line: 384, column: 9, scope: !80)
!661 = !MDLocation(line: 385, column: 9, scope: !662)
!662 = !{!"0xb\00385\009\00110", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!663 = !MDLocation(line: 385, column: 9, scope: !80)
!664 = !MDLocation(line: 387, column: 9, scope: !665)
!665 = !{!"0xb\00387\009\00111", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!666 = !MDLocation(line: 387, column: 9, scope: !80)
!667 = !MDLocation(line: 388, column: 9, scope: !668)
!668 = !{!"0xb\00388\009\00112", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!669 = !MDLocation(line: 388, column: 9, scope: !80)
!670 = !MDLocation(line: 390, column: 9, scope: !671)
!671 = !{!"0xb\00390\009\00113", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!672 = !MDLocation(line: 390, column: 9, scope: !80)
!673 = !MDLocation(line: 391, column: 9, scope: !674)
!674 = !{!"0xb\00391\009\00114", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!675 = !MDLocation(line: 391, column: 9, scope: !80)
!676 = !MDLocation(line: 393, column: 9, scope: !677)
!677 = !{!"0xb\00393\009\00115", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!678 = !MDLocation(line: 393, column: 9, scope: !80)
!679 = !MDLocation(line: 394, column: 9, scope: !680)
!680 = !{!"0xb\00394\009\00116", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!681 = !MDLocation(line: 394, column: 9, scope: !80)
!682 = !MDLocation(line: 396, column: 9, scope: !683)
!683 = !{!"0xb\00396\009\00117", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!684 = !MDLocation(line: 396, column: 9, scope: !80)
!685 = !MDLocation(line: 397, column: 9, scope: !686)
!686 = !{!"0xb\00397\009\00118", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!687 = !MDLocation(line: 397, column: 9, scope: !80)
!688 = !MDLocation(line: 399, column: 9, scope: !689)
!689 = !{!"0xb\00399\009\00119", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!690 = !MDLocation(line: 399, column: 9, scope: !80)
!691 = !MDLocation(line: 400, column: 9, scope: !692)
!692 = !{!"0xb\00400\009\00120", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!693 = !MDLocation(line: 400, column: 9, scope: !80)
!694 = !MDLocation(line: 402, column: 9, scope: !695)
!695 = !{!"0xb\00402\009\00121", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!696 = !MDLocation(line: 402, column: 9, scope: !80)
!697 = !MDLocation(line: 403, column: 9, scope: !698)
!698 = !{!"0xb\00403\009\00122", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!699 = !MDLocation(line: 403, column: 9, scope: !80)
!700 = !MDLocation(line: 405, column: 9, scope: !701)
!701 = !{!"0xb\00405\009\00123", !1, !80}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!702 = !MDLocation(line: 405, column: 9, scope: !80)
!703 = !MDLocation(line: 406, column: 5, scope: !80)
!704 = !MDLocation(line: 407, column: 1, scope: !80)
!705 = !MDLocation(line: 409, column: 9, scope: !101)
!706 = !MDLocation(line: 410, column: 8, scope: !101)
!707 = !MDLocation(line: 410, column: 13, scope: !101)
!708 = !MDLocation(line: 409, column: 12, scope: !101)
!709 = !MDLocation(line: 427, column: 7, scope: !710)
!710 = !{!"0xb\00427\007\00124", !1, !101}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!711 = !MDLocation(line: 427, column: 7, scope: !101)
!712 = !MDLocation(line: 430, column: 7, scope: !713)
!713 = !{!"0xb\00430\007\00125", !1, !101}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!714 = !MDLocation(line: 430, column: 7, scope: !101)
!715 = !MDLocation(line: 437, column: 3, scope: !716)
!716 = !{!"0xb\00437\003\00130", !1, !101}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!717 = !MDLocation(line: 431, column: 9, scope: !718)
!718 = !{!"0xb\00431\009\00127", !1, !719}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!719 = !{!"0xb\00430\0019\00126", !1, !713}       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!720 = !MDLocation(line: 431, column: 9, scope: !719)
!721 = !MDLocation(line: 431, column: 27, scope: !718)
!722 = !MDLocation(line: 431, column: 26, scope: !718)
!723 = !MDLocation(line: 431, column: 20, scope: !718)
!724 = !MDLocation(line: 432, column: 25, scope: !725)
!725 = !{!"0xb\00432\005\00129", !1, !726}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!726 = !{!"0xb\00432\005\00128", !1, !719}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!727 = !MDLocation(line: 432, column: 5, scope: !726)
!728 = !MDLocation(line: 433, column: 4, scope: !725)
!729 = !MDLocation(line: 432, column: 20, scope: !725)
!730 = !MDLocation(line: 425, column: 7, scope: !101)
!731 = !MDLocation(line: 438, column: 5, scope: !732)
!732 = !{!"0xb\00437\003\00131", !1, !716}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!733 = !MDLocation(line: 437, column: 18, scope: !732)
!734 = !MDLocation(line: 437, column: 23, scope: !732)
!735 = !MDLocation(line: 440, column: 1, scope: !101)
!736 = !MDLocation(line: 442, column: 5, scope: !110)
!737 = !MDLocation(line: 443, column: 8, scope: !110)
!738 = !MDLocation(line: 443, column: 12, scope: !110)
!739 = !MDLocation(line: 443, column: 16, scope: !110)
!740 = !MDLocation(line: 442, column: 8, scope: !110)
!741 = !MDLocation(line: 462, column: 7, scope: !742)
!742 = !{!"0xb\00462\007\00132", !1, !110}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!743 = !MDLocation(line: 462, column: 7, scope: !110)
!744 = !MDLocation(line: 464, column: 7, scope: !745)
!745 = !{!"0xb\00464\007\00133", !1, !110}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!746 = !MDLocation(line: 460, column: 16, scope: !110)
!747 = !MDLocation(line: 465, column: 5, scope: !748)
!748 = !{!"0xb\00465\005\00134", !1, !745}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!749 = !MDLocation(line: 464, column: 7, scope: !110)
!750 = !MDLocation(line: 466, column: 12, scope: !751)
!751 = !{!"0xb\00465\005\00135", !1, !748}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!752 = !MDLocation(line: 466, column: 17, scope: !751)
!753 = !MDLocation(line: 466, column: 7, scope: !751)
!754 = !MDLocation(line: 465, column: 20, scope: !751)
!755 = !MDLocation(line: 465, column: 25, scope: !751)
!756 = !MDLocation(line: 465, column: 30, scope: !751)
!757 = !MDLocation(line: 465, column: 35, scope: !751)
!758 = !MDLocation(line: 469, column: 12, scope: !759)
!759 = !{!"0xb\00468\005\00137", !1, !760}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!760 = !{!"0xb\00468\005\00136", !1, !745}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!761 = !MDLocation(line: 469, column: 17, scope: !759)
!762 = !MDLocation(line: 469, column: 7, scope: !759)
!763 = !MDLocation(line: 468, column: 20, scope: !759)
!764 = !MDLocation(line: 468, column: 25, scope: !759)
!765 = !MDLocation(line: 468, column: 30, scope: !759)
!766 = !MDLocation(line: 468, column: 35, scope: !759)
!767 = !MDLocation(line: 468, column: 5, scope: !760)
!768 = !MDLocation(line: 470, column: 1, scope: !110)
!769 = !MDLocation(line: 472, column: 5, scope: !120)
!770 = !MDLocation(line: 473, column: 8, scope: !120)
!771 = !MDLocation(line: 473, column: 11, scope: !120)
!772 = !MDLocation(line: 484, column: 7, scope: !773)
!773 = !{!"0xb\00484\007\00138", !1, !120}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!774 = !MDLocation(line: 484, column: 7, scope: !120)
!775 = !MDLocation(line: 485, column: 3, scope: !776)
!776 = !{!"0xb\00485\003\00139", !1, !120}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!777 = !MDLocation(line: 486, column: 5, scope: !778)
!778 = !{!"0xb\00485\003\00140", !1, !776}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/blas.c]
!779 = !MDLocation(line: 485, column: 18, scope: !778)
!780 = !MDLocation(line: 482, column: 16, scope: !120)
!781 = !MDLocation(line: 485, column: 23, scope: !778)
!782 = !MDLocation(line: 487, column: 1, scope: !120)
