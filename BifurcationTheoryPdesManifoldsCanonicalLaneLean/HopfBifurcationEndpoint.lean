import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationTheoryPdesManifoldsCanonicalLaneLean

structure HopfBifurcationEndpointPackage (F : BifurcationPDEPackage) (C : CenterManifoldPackage F)
    (L : LyapunovSchmidtPackage F C) where
  eigenvalueCrossing : Prop
  periodicOrbitExists : Prop
  stabilityChange : Prop
  amplitudeFormula : Prop

structure HopfBifurcationEndpointEvidence (F : BifurcationPDEPackage) (C : CenterManifoldPackage F)
    (L : LyapunovSchmidtPackage F C) (H : HopfBifurcationEndpointPackage F C L) where
  eigenvalueCrossingClosed : H.eigenvalueCrossing
  periodicOrbitExistsClosed : H.periodicOrbitExists
  stabilityChangeClosed : H.stabilityChange
  amplitudeFormulaClosed : H.amplitudeFormula

def HopfBifurcationEndpointClosed (F : BifurcationPDEPackage) (C : CenterManifoldPackage F)
    (L : LyapunovSchmidtPackage F C) (H : HopfBifurcationEndpointPackage F C L) : Prop :=
  H.eigenvalueCrossing ∧ H.periodicOrbitExists ∧ H.stabilityChange ∧ H.amplitudeFormula

theorem hopf_bifurcation_endpoint_closed_from_evidence (F : BifurcationPDEPackage)
    (C : CenterManifoldPackage F) (L : LyapunovSchmidtPackage F C)
    (H : HopfBifurcationEndpointPackage F C L)
    (E : HopfBifurcationEndpointEvidence F C L H) : HopfBifurcationEndpointClosed F C L H := by
  exact And.intro E.eigenvalueCrossingClosed
    (And.intro E.periodicOrbitExistsClosed
      (And.intro E.stabilityChangeClosed E.amplitudeFormulaClosed))

end BifurcationTheoryPdesManifoldsCanonicalLaneLean
end HautevilleHouse