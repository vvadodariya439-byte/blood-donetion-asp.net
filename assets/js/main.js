/* ============================================================
   Blood Bank Management System - Main JavaScript
   ============================================================ */

'use strict';

/* ── Sidebar Toggle ─────────────────────────────────────── */
const sidebar        = document.getElementById('sidebar');
const sidebarOverlay = document.getElementById('sidebarOverlay');
const sidebarToggle  = document.getElementById('sidebarToggle');

if (sidebarToggle) {
  sidebarToggle.addEventListener('click', () => {
    sidebar.classList.toggle('open');
    sidebarOverlay.classList.toggle('show');
  });
}
if (sidebarOverlay) {
  sidebarOverlay.addEventListener('click', () => {
    sidebar.classList.remove('open');
    sidebarOverlay.classList.remove('show');
  });
}

/* ── Active nav link ─────────────────────────────────────── */
document.querySelectorAll('.nav-item-link').forEach(link => {
  if (link.href && link.href === window.location.href) {
    link.classList.add('active');
  }
});

/* ── Toast Notification ─────────────────────────────────── */
function showToast(message, type = 'success') {
  const icons = { success: 'fa-check-circle', danger: 'fa-times-circle',
                  warning: 'fa-exclamation-triangle', info: 'fa-info-circle' };
  const toastContainer = document.getElementById('toastContainer');
  if (!toastContainer) return;

  const id = 'toast_' + Date.now();
  const html = `
    <div id="${id}" class="toast align-items-center text-bg-${type} border-0 mb-2" role="alert">
      <div class="d-flex">
        <div class="toast-body d-flex align-items-center gap-2">
          <i class="fas ${icons[type] || icons.info}"></i>
          ${message}
        </div>
        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
      </div>
    </div>`;
  toastContainer.insertAdjacentHTML('beforeend', html);
  const el = document.getElementById(id);
  new bootstrap.Toast(el, { delay: 3500 }).show();
  el.addEventListener('hidden.bs.toast', () => el.remove());
}

/* ── Confirm Delete Modal ────────────────────────────────── */
function confirmDelete(callback) {
  const modal = document.getElementById('deleteModal');
  if (!modal) { if (confirm('Are you sure you want to delete this record?')) callback(); return; }
  const bsModal = new bootstrap.Modal(modal);
  document.getElementById('confirmDeleteBtn').onclick = () => { bsModal.hide(); callback(); };
  bsModal.show();
}

/* ── Search Filter (client-side) ────────────────────────── */
function initTableSearch(inputId, tableId) {
  const input = document.getElementById(inputId);
  const table = document.getElementById(tableId);
  if (!input || !table) return;
  input.addEventListener('input', function () {
    const q = this.value.toLowerCase();
    table.querySelectorAll('tbody tr').forEach(row => {
      row.style.display = row.textContent.toLowerCase().includes(q) ? '' : 'none';
    });
  });
}

/* ── Blood Group Filter ─────────────────────────────────── */
function initBloodGroupFilter(selectId, tableId) {
  const select = document.getElementById(selectId);
  const table  = document.getElementById(tableId);
  if (!select || !table) return;
  select.addEventListener('change', function () {
    const val = this.value.toLowerCase();
    table.querySelectorAll('tbody tr').forEach(row => {
      const cell = row.querySelector('[data-blood]');
      row.style.display = (!val || (cell && cell.dataset.blood.toLowerCase() === val)) ? '' : 'none';
    });
  });
}

/* ── Status Filter ──────────────────────────────────────── */
function initStatusFilter(selectId, tableId) {
  const select = document.getElementById(selectId);
  const table  = document.getElementById(tableId);
  if (!select || !table) return;
  select.addEventListener('change', function () {
    const val = this.value.toLowerCase();
    table.querySelectorAll('tbody tr').forEach(row => {
      const cell = row.querySelector('[data-status]');
      row.style.display = (!val || (cell && cell.dataset.status.toLowerCase() === val)) ? '' : 'none';
    });
  });
}

/* ── Eligibility Checker ─────────────────────────────────── */
function checkEligibility() {
  const age          = parseInt(document.getElementById('eligAge')?.value) || 0;
  const weight       = parseFloat(document.getElementById('eligWeight')?.value) || 0;
  const lastDonation = document.getElementById('eligLastDonation')?.value;
  const resultDiv    = document.getElementById('eligResult');
  if (!resultDiv) return;

  const issues = [];
  if (age < 18)  issues.push('Age must be at least 18 years.');
  if (age > 60)  issues.push('Age must not exceed 60 years.');
  if (weight < 50) issues.push('Weight must be at least 50 kg.');

  if (lastDonation) {
    const last    = new Date(lastDonation);
    const today   = new Date();
    const diffDays = Math.floor((today - last) / (1000 * 60 * 60 * 24));
    if (diffDays < 90) {
      const remaining = 90 - diffDays;
      issues.push(`Last donation was ${diffDays} days ago. Please wait ${remaining} more day(s).`);
    }
  }

  if (issues.length === 0) {
    resultDiv.innerHTML = `
      <div class="eligibility-result eligible fade-in-up">
        <div class="eligibility-icon"><i class="fas fa-check-circle"></i></div>
        <div class="eligibility-title">You Are Eligible to Donate!</div>
        <p class="eligibility-text mt-2">You meet all the requirements. Book your appointment today and save lives.</p>
        <a href="appointments.html" class="btn btn-light btn-sm mt-3 fw-600">
          <i class="fas fa-calendar-plus me-1"></i> Book Appointment
        </a>
      </div>`;
  } else {
    resultDiv.innerHTML = `
      <div class="eligibility-result ineligible fade-in-up">
        <div class="eligibility-icon"><i class="fas fa-times-circle"></i></div>
        <div class="eligibility-title">Not Eligible at This Time</div>
        <ul class="eligibility-text text-start mt-3 mb-0" style="list-style:none;padding:0">
          ${issues.map(i => `<li class="mb-1"><i class="fas fa-exclamation-circle me-2"></i>${i}</li>`).join('')}
        </ul>
      </div>`;
  }
}

/* ── Password Toggle ─────────────────────────────────────── */
document.querySelectorAll('[data-toggle-password]').forEach(btn => {
  btn.addEventListener('click', function () {
    const target = document.getElementById(this.dataset.togglePassword);
    if (!target) return;
    const isText = target.type === 'text';
    target.type = isText ? 'password' : 'text';
    this.querySelector('i').className = `fas fa-eye${isText ? '' : '-slash'}`;
  });
});

/* ── Role Selector (Login Page) ─────────────────────────── */
document.querySelectorAll('.role-btn').forEach(btn => {
  btn.addEventListener('click', function () {
    document.querySelectorAll('.role-btn').forEach(b => b.classList.remove('active'));
    this.classList.add('active');
  });
});

/* ── Charts (Admin Dashboard) ────────────────────────────── */
function initDashboardCharts() {

  // Blood Group Availability - Doughnut
  const bgCtx = document.getElementById('bloodGroupChart');
  if (bgCtx) {
    new Chart(bgCtx, {
      type: 'doughnut',
      data: {
        labels: ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'],
        datasets: [{
          data: [120, 45, 95, 30, 60, 20, 150, 55],
          backgroundColor: ['#c0392b','#e74c3c','#2980b9','#3498db','#27ae60','#2ecc71','#8e44ad','#9b59b6'],
          borderWidth: 3, borderColor: '#fff',
        }]
      },
      options: {
        responsive: true, maintainAspectRatio: false,
        plugins: { legend: { position: 'right', labels: { font: { size: 11 }, padding: 12 } } },
        cutout: '65%'
      }
    });
  }

  // Monthly Donations - Bar
  const mdCtx = document.getElementById('monthlyDonationsChart');
  if (mdCtx) {
    new Chart(mdCtx, {
      type: 'bar',
      data: {
        labels: ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'],
        datasets: [{
          label: 'Donations',
          data: [42, 55, 63, 48, 72, 89, 95, 78, 65, 81, 74, 68],
          backgroundColor: 'rgba(192,57,43,.8)',
          borderRadius: 6, borderSkipped: false,
        },{
          label: 'Requests',
          data: [38, 45, 55, 44, 61, 75, 82, 69, 58, 73, 67, 59],
          backgroundColor: 'rgba(41,128,185,.8)',
          borderRadius: 6, borderSkipped: false,
        }]
      },
      options: {
        responsive: true, maintainAspectRatio: false,
        plugins: { legend: { position: 'top', labels: { font: { size: 11 } } } },
        scales: {
          y: { beginAtZero: true, grid: { color: '#f0f0f0' }, ticks: { font: { size: 11 } } },
          x: { grid: { display: false }, ticks: { font: { size: 11 } } }
        }
      }
    });
  }

  // Blood Collection - Line
  const bcCtx = document.getElementById('bloodCollectionChart');
  if (bcCtx) {
    new Chart(bcCtx, {
      type: 'line',
      data: {
        labels: ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'],
        datasets: [{
          label: 'Units Collected',
          data: [210, 275, 315, 240, 360, 445, 475, 390, 325, 405, 370, 340],
          borderColor: '#c0392b',
          backgroundColor: 'rgba(192,57,43,.08)',
          tension: 0.4, fill: true,
          pointBackgroundColor: '#c0392b', pointRadius: 4,
        }]
      },
      options: {
        responsive: true, maintainAspectRatio: false,
        plugins: { legend: { display: false } },
        scales: {
          y: { beginAtZero: true, grid: { color: '#f0f0f0' }, ticks: { font: { size: 11 } } },
          x: { grid: { display: false }, ticks: { font: { size: 11 } } }
        }
      }
    });
  }

  // Request Status - Pie
  const rsCtx = document.getElementById('requestStatusChart');
  if (rsCtx) {
    new Chart(rsCtx, {
      type: 'pie',
      data: {
        labels: ['Approved', 'Pending', 'Rejected', 'On Hold'],
        datasets: [{
          data: [145, 68, 32, 18],
          backgroundColor: ['#27ae60','#f39c12','#e74c3c','#3498db'],
          borderWidth: 3, borderColor: '#fff',
        }]
      },
      options: {
        responsive: true, maintainAspectRatio: false,
        plugins: { legend: { position: 'right', labels: { font: { size: 11 }, padding: 12 } } }
      }
    });
  }

  // Donor Dashboard - Mini Chart
  const donorCtx = document.getElementById('donorDonationChart');
  if (donorCtx) {
    new Chart(donorCtx, {
      type: 'bar',
      data: {
        labels: ['Jan','Mar','Jun','Sep','Dec'],
        datasets: [{
          label: 'Donations',
          data: [1, 0, 1, 1, 0],
          backgroundColor: 'rgba(192,57,43,.8)',
          borderRadius: 4, borderSkipped: false,
        }]
      },
      options: {
        responsive: true, maintainAspectRatio: false,
        plugins: { legend: { display: false } },
        scales: {
          y: { beginAtZero: true, ticks: { stepSize: 1, font: { size: 10 } }, grid: { color: '#f8f8f8' } },
          x: { grid: { display: false }, ticks: { font: { size: 10 } } }
        }
      }
    });
  }
}

/* ── Init on DOM ready ───────────────────────────────────── */
document.addEventListener('DOMContentLoaded', () => {
  initDashboardCharts();

  // Initialize table search for known tables
  initTableSearch('searchDonor',   'donorTable');
  initTableSearch('searchUser',    'userTable');
  initTableSearch('searchRequest', 'requestTable');
  initTableSearch('searchHospital','hospitalTable');
  initTableSearch('searchCamp',    'campTable');

  initBloodGroupFilter('filterBloodGroup', 'donorTable');
  initStatusFilter('filterStatus', 'donorTable');
  initStatusFilter('filterRequestStatus', 'requestTable');

  // Tooltips
  document.querySelectorAll('[data-bs-toggle="tooltip"]')
    .forEach(el => new bootstrap.Tooltip(el));

  // Popovers
  document.querySelectorAll('[data-bs-toggle="popover"]')
    .forEach(el => new bootstrap.Popover(el));

  // Fade-in-up on scroll
  const observer = new IntersectionObserver(entries => {
    entries.forEach(e => {
      if (e.isIntersecting) { e.target.classList.add('fade-in-up'); observer.unobserve(e.target); }
    });
  }, { threshold: 0.1 });
  document.querySelectorAll('.stat-widget, .content-card, .inventory-card, .camp-card')
    .forEach(el => observer.observe(el));
});

/* ── Print Report ────────────────────────────────────────── */
function printReport(sectionId) {
  const section = document.getElementById(sectionId);
  if (!section) { window.print(); return; }
  const win = window.open('', '_blank');
  win.document.write(`<html><head><title>Report</title>
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    </head><body class="p-4">${section.innerHTML}</body></html>`);
  win.document.close();
  win.focus();
  win.print();
  win.close();
}

/* ── Update Page Title (breadcrumb) ─────────────────────── */
function setPageTitle(title, sub) {
  const el = document.getElementById('pageTitle');
  const se = document.getElementById('pageSubtitle');
  if (el) el.textContent = title;
  if (se && sub) se.textContent = sub;
}
