import os
import re

notes_path = 'app/pages/NotesPage.jsx'
with open(notes_path, 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Update Tally in SUBJECTS
old_tally_block = '''    previewPdfGu: '/downloads/Tally-Prime-Gujarati-Edition-1-5Page-Preview.pdf',
    fullPdfEn: '/downloads/Tally-Prime-English-Edition-1.pdf',
    fullPdfHi: '/downloads/Tally-Prime-Hindi-Edition-1.pdf',
    fullPdfGu: '/downloads/Tally-Prime-Gujarati-Edition-1.pdf',
    bundleZip: '/downloads/Tally-Prime-Career-Accelerator-Bundle.zip','''

new_tally_block = '''    previewPdfGu: '/downloads/Tally-Prime-Gujarati-Edition-1-5Page-Preview.pdf',
    fullPdfEn: '/downloads/Tally-Prime-English-Edition-1.pdf',
    fullPdfHi: '/downloads/Tally-Prime-Hindi-Edition-1.pdf',
    fullPdfGu: '/downloads/Tally-Prime-Gujarati-Edition-1.pdf',
    hasCheatSheet: true,
    cheatSheetPages: '8 Pages Desk Reference',
    cheatSheetPdfEn: '/downloads/Tally-Prime-Quick-Desk-Reference-Cheat-Sheet-English.pdf',
    cheatSheetPdfHi: '/downloads/Tally-Prime-Quick-Desk-Reference-Cheat-Sheet-Edition-1.pdf',
    cheatSheetPdfGu: '/downloads/Tally-Prime-Quick-Desk-Reference-Cheat-Sheet-Gujarati.pdf',
    bundleZip: '/downloads/Tally-Prime-Career-Accelerator-Bundle.zip','''

assert old_tally_block in content, "old_tally_block not found in NotesPage.jsx!"
content = content.replace(old_tally_block, new_tally_block, 1)

# 2. Add Cheat Sheet item to Tally bundleItems
old_bundle_item = "{ name: 'Tally Prime with GST Core Master Guide (English)', pages: '51 Pages', file: 'Tally-Prime-English-Edition-1.pdf', badge: 'Master Guide' },"
new_bundle_item = "{ name: 'Tally Prime 2027 8-Page Desk Reference & Cheat Sheet (All Languages)', pages: '8 Pages', file: 'Tally-Prime-Quick-Desk-Reference-Cheat-Sheet-Edition-1.pdf', badge: '⚡ Desk Sheet' },\n      { name: 'Tally Prime with GST Core Master Guide (English)', pages: '51 Pages', file: 'Tally-Prime-English-Edition-1.pdf', badge: 'Master Guide' },"

assert old_bundle_item in content, "old_bundle_item not found in NotesPage.jsx!"
content = content.replace(old_bundle_item, new_bundle_item, 1)

# 3. Update handleDirectCheckout & proceedToCheckoutWithSelectedPlan
old_direct_checkout = '''  // Direct checkout
  const handleDirectCheckout = (sub, plan = 'bundle') => {
    setSelectedSubject(sub);
    setCheckoutItem({
      title: `${sub.title} (${plan === 'bundle' ? 'Complete Career Accelerator Suite' : 'Core Master Pass'})`,
      plan: plan,
      price: plan === 'bundle' ? 149 : 49,
    });
    setIsCheckoutOpen(true);
  };

  // Proceed from Package Modal to Razorpay Checkout Modal
  const proceedToCheckoutWithSelectedPlan = () => {
    setCheckoutItem({
      title: `${selectedSubject.title} (${modalSelectedPlan === 'bundle' ? 'Complete Career Accelerator Suite' : 'Core Master Pass'})`,
      plan: modalSelectedPlan,
      price: modalSelectedPlan === 'bundle' ? 149 : 49,
    });
    setIsUpsellOpen(false);
    setIsCheckoutOpen(true);
  };'''

new_direct_checkout = '''  // Direct checkout
  const handleDirectCheckout = (sub, plan = 'bundle') => {
    setSelectedSubject(sub);
    let title = `${sub.title} (Complete Career Accelerator Suite)`;
    let price = 149;
    if (plan === 'cheatsheet') {
      title = `${sub.title} (⚡ 8-Page Desk Reference & Cheat Sheet)`;
      price = 22;
    } else if (plan === 'single') {
      title = `${sub.title} (📘 Core Master Pass - 51 Pages)`;
      price = 49;
    }
    setCheckoutItem({
      title,
      plan,
      price,
    });
    setIsCheckoutOpen(true);
  };

  // Proceed from Package Modal to Razorpay Checkout Modal
  const proceedToCheckoutWithSelectedPlan = () => {
    let title = `${selectedSubject.title} (Complete Career Accelerator Suite)`;
    let price = 149;
    if (modalSelectedPlan === 'cheatsheet') {
      title = `${selectedSubject.title} (⚡ 8-Page Desk Reference & Cheat Sheet)`;
      price = 22;
    } else if (modalSelectedPlan === 'single') {
      title = `${selectedSubject.title} (📘 Core Master Pass - Complete Guide)`;
      price = 49;
    }
    setCheckoutItem({
      title,
      plan: modalSelectedPlan,
      price,
    });
    setIsUpsellOpen(false);
    setIsCheckoutOpen(true);
  };'''

assert old_direct_checkout in content, "old_direct_checkout not found!"
content = content.replace(old_direct_checkout, new_direct_checkout, 1)

# 4. Check URL param for plan in useEffect
old_url_effect = '''      const targetId = (params.get('book') || params.get('subject') || hash).toLowerCase();
      if (targetId) {
        const found = SUBJECTS.find(
          (s) => s.id === targetId || s.category === targetId
        );
        if (found) {
          setSelectedSubject(found);
          const targetEl = document.getElementById(targetId);
          if (targetEl) {
            targetEl.scrollIntoView({ behavior: 'smooth', block: 'center' });
          }
        }
      }'''

new_url_effect = '''      const targetId = (params.get('book') || params.get('subject') || hash).toLowerCase();
      const planParam = (params.get('plan') || '').toLowerCase();
      if (targetId) {
        const found = SUBJECTS.find(
          (s) => s.id === targetId || s.category === targetId
        );
        if (found) {
          setSelectedSubject(found);
          if (planParam === 'cheatsheet' || planParam === '22') {
            setModalSelectedPlan('cheatsheet');
            setIsUpsellOpen(true);
          } else if (planParam === 'single' || planParam === '49') {
            setModalSelectedPlan('single');
            setIsUpsellOpen(true);
          }
          const targetEl = document.getElementById(targetId);
          if (targetEl) {
            targetEl.scrollIntoView({ behavior: 'smooth', block: 'center' });
          }
        }
      }'''

assert old_url_effect in content, "old_url_effect not found!"
content = content.replace(old_url_effect, new_url_effect, 1)

with open(notes_path, 'w', encoding='utf-8') as f:
    f.write(content)

print("Part 1: Basic state, helpers, and subjects updated successfully!")
