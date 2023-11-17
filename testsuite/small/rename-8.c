/* { dg-options "-DCE_EXTRACT_FUNCTIONS=f -DCE_EXPORT_SYMBOLS=bbb" }*/

int bbb;

#define A bbb
#define B bbb

int f()
{
  return A + B ;
}

/* { dg-final { scan-tree-dump "static int \*klp_bbb;" } } */
/* { dg-final { scan-tree-dump "#define A \*\(klp_bbb\)" } } */
/* { dg-final { scan-tree-dump "#define B \*\(klp_bbb\)" } } */
