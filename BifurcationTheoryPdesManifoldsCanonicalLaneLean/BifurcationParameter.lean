import HautevilleHouse.BifurcationTheoryPdesManifoldsCanonicalLaneLean.BifurcationPDE

namespace HautevilleHouse
namespace BifurcationTheoryPdesManifoldsCanonicalLaneLean

structure BifurcationParameterPackage {M : BifurcationManifoldPackage}
    (F : BifurcationPDEPackage M) where
  parameterRange : Set (F.parameterSpace)
  bifurcationPoint : F.parameterSpace
  regularValues : Set (F.parameterSpace)
  parameterContinuity : Prop
  transversality : Prop

structure BifurcationParameterEvidence {M : BifurcationManifoldPackage}
    {F : BifurcationPDEPackage M} (P : BifurcationParameterPackage F) where
  parameterContinuityClosed : P.parameterContinuity
  transversalityClosed : P.transversality

def BifurcationParameterClosed {M : BifurcationManifoldPackage}
    {F : BifurcationPDEPackage M} (P : BifurcationParameterPackage F) : Prop :=
  P.parameterContinuity ∧ P.transversality

theorem bifurcation_parameter_closed_from_evidence {M : BifurcationManifoldPackage}
    {F : BifurcationPDEPackage M} (P : BifurcationParameterPackage F)
    (E : BifurcationParameterEvidence P) : BifurcationParameterClosed P := by
  exact And.intro E.parameterContinuityClosed E.transversalityClosed

end BifurcationTheoryPdesManifoldsCanonicalLaneLean
end HautevilleHouse
